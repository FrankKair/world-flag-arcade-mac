//
//  ViewController.swift
//  WorldGeographyArcade
//
//  Created by Frank Magagnin Kair on 01/04/19.
//  Copyright © 2019 Frank Magagnin Kair. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var game = Game()
    var answer: Country?
    @IBOutlet weak var flag1: FlagView! { didSet { flag1.delegate = self } }
    @IBOutlet weak var flag2: FlagView! { didSet { flag2.delegate = self } }
    @IBOutlet weak var flag3: FlagView! { didSet { flag3.delegate = self } }
    @IBOutlet weak var flag4: FlagView! { didSet { flag4.delegate = self } }
    @IBOutlet weak var countryName: NSTextField!
    @IBOutlet weak var score: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        nextRound()
    }

    @objc private func nextRound() {
        score.stringValue = "Score: \(game.getScore())"
        let round = game.getCountries()
        answer = round.answer
        flag1.image = round.options[0].flag
        flag2.image = round.options[1].flag
        flag3.image = round.options[2].flag
        flag4.image = round.options[3].flag
        countryName.stringValue = round.answer.name
    }
}

extension ViewController: FlagClickDelegate {
    func flagClick(withCode code: String) {
        if code == answer?.code {
            game.updateScore()
        } else {
            game.resetGame()
        }
        nextRound()
    }
}

protocol FlagClickDelegate {
    func flagClick(withCode code: String)
}

class FlagView: NSImageView {
    var delegate: FlagClickDelegate?

    override func mouseDown(with event: NSEvent) {
        let imgName = String(self.image!.name()!)
        guard let delegate = delegate else { return }
        delegate.flagClick(withCode: imgName)
    }
}
