//
//  ViewController.swift
//  apple-pie
//
//  Created by Yafira on 4/26/22.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["flowers", "ultimate", "phonetic", "preview", "next"]
    let incorrectMovesAllowed = 7
    var totalWins = 0
    var totalLosses = 0
    var currRound: GameRound!
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    
    func newRound(){
        let newWord = listOfWords.removeFirst()
        currRound = GameRound(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        updateUI()
    }
    
    func updateUI(){
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currRound.incorrectMovesRemaining)")
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        //need to access the title of my UIButton
        let buttonTitle = sender.titleLabel?.text
        let buttonLetter = Character(buttonTitle!.lowercased())
        currRound.playerGuessed(letter: buttonLetter)
        updateUI()
    }
    

}


