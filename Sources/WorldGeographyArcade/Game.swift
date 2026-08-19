import Foundation
import Observation

enum AnswerResult {
    case correct, wrong, none
}

struct Round {
    let options: [Country]
    let answer: Country
}

@Observable
final class Game {
    private var countries: [Country] = []
    private var seen: Set<String> = []
    private(set) var score = 0
    private(set) var highScore = 0
    private(set) var currentRound: Round?
    private(set) var lastResult: AnswerResult = .none

    init() {
        loadCountries()
        nextRound()
    }

    private func loadCountries() {
        guard let url = Bundle.module.url(forResource: "countries", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([Country].self, from: data)
        else {
            fatalError("Failed to load countries.json from bundle resources")
        }
        countries = decoded
    }

    func nextRound() {
        guard countries.count >= 4 else { return }
        if seen.count > countries.count - 4 {
            seen.removeAll()
        }

        let available = countries.filter { !seen.contains($0.code) }.shuffled()
        let options = Array(available.prefix(4))
        guard let answer = options.randomElement() else { return }

        seen.insert(answer.code)
        currentRound = Round(options: options, answer: answer)
        lastResult = .none
    }

    func submit(code: String) {
        guard let round = currentRound else { return }
        if code == round.answer.code {
            score += 1
            highScore = max(highScore, score)
            lastResult = .correct
        } else {
            score = 0
            seen.removeAll()
            lastResult = .wrong
        }
    }
}
