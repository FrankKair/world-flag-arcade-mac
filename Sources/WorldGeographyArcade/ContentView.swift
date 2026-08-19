import SwiftUI

struct ContentView: View {
    @State private var game = Game()

    var body: some View {
        VStack(spacing: 28) {
            header

            Spacer()

            if let round = game.currentRound {
                question(round: round)
                flagGrid(round: round)
            }

            feedback
            Spacer()
        }
        .padding(32)
        .frame(minWidth: 580, minHeight: 520)
    }

    // MARK: - Subviews

    private var header: some View {
        HStack {
            Label("\(game.score)", systemImage: "star.fill")
                .font(.title2.bold())
                .foregroundStyle(.yellow)

            Spacer()

            Label("Best: \(game.highScore)", systemImage: "trophy.fill")
                .font(.callout)
                .foregroundStyle(.orange)
        }
    }

    private func question(round: Round) -> some View {
        VStack() {
            Text("Which flag belongs to")
                .font(.title3)
                .foregroundStyle(.secondary)

            Text(round.answer.name)
                .font(.largeTitle.bold())

            Text(round.answer.capital)
                .font(.subheadline)
                .foregroundStyle(.tertiary)
        }
    }

    private func flagGrid(round: Round) -> some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
            ForEach(round.options) { country in
                Button {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        game.submit(code: country.code)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation { game.nextRound() }
                    }
                } label: {
                    Text(country.flag)
                        .font(.system(size: 64))
                        .frame(maxWidth: .infinity)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.ultraThinMaterial)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(borderColor(for: country.code), lineWidth: 3)
                        )
                }
                .buttonStyle(.plain)
                .disabled(game.lastResult != .none)
            }
        }
    }

    private var feedback: some View {
        Group {
            switch game.lastResult {
                case .correct:
                    Label("Correct!", systemImage: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                case .wrong:
                    Label("Wrong -- score reset", systemImage: "xmark.circle.fill")
                        .foregroundStyle(.red)
                case .none:
                    Text(" ")
            }
        }
        .font(.title3.bold())
        .transition(.scale.combined(with: .opacity))
    }

    // MARK: - Helpers

    private func borderColor(for code: String) -> Color {
        guard game.lastResult != .none,
              let round = game.currentRound else { return .clear }

        if code == round.answer.code {
            return .green
        }
        if game.lastResult == .wrong {
            return .red.opacity(0.3)
        }
        return .clear
    }
}
