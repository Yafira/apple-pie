//
//  GameRound.swift
//  apple-pie
//
//  Created by Yafira on 4/28/22.
//

import Foundation

struct GameRound {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters : [Character]
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    
    mutating func playerGuessed(letter: Character){
        //added a newly guessed letter to the guessedLetters array
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }
}
