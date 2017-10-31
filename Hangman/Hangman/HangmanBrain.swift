//
//  HangmanBrain.swift
//  Hangman
//
//  Created by C4Q on 10/28/17.
//  Copyright © 2017 Marcel Chaucer. All rights reserved.
//
import Foundation

enum GameStateUpdate {
    case correct
    case wrong
    case alreadyUsed
    
}
class HangmanBrain {
    enum GameState {
        case victory, defeat, ongoing
    }
    var secretWord: String = ""
    var gameBoardArray = [String]() // ["_", "_" ,"_"]
    var usedLettersArray: [String] = []
    var numberOfWrongGuessesLeft = 7
    
    ///func for creating secret
    func makeGameBoard(from word: String) -> [String]{
        //This sets the empty gameBoard to length of secret word
        for _ in 0..<word.count {
            gameBoardArray.append("_")
        }
        return gameBoardArray
    }
    ///func for updating board
    func updateGameBoardArray(_ playerGuess: String) -> [String] {
        for letter in 0..<secretWord.count {
            if playerGuess == String(secretWord[secretWord.index(secretWord.startIndex, offsetBy: letter)]) {
                gameBoardArray[letter] = playerGuess
            }
        }
        return gameBoardArray
    }
    ///func for guessing letter
    func getGuessedLetter(from playerGuess: String) -> GameStateUpdate {
        //correct and wrong letter check
        if !secretWord.contains(playerGuess){
            usedLettersArray.append(playerGuess)
            numberOfWrongGuessesLeft -= 1
            usedLettersArray.append(playerGuess)
            return .wrong
        }
        if usedLettersArray.contains(playerGuess) {
            return .alreadyUsed
        }
        usedLettersArray.append(playerGuess)
        print(playerGuess)
        return .correct
    }
    ///func for result scenario
    func victoryCheck() -> GameState {
        if numberOfWrongGuessesLeft == 0 {
            return .defeat
        }
        if !gameBoardArray.contains("_") {
            return .victory
        }
        return .ongoing
    }
}//end of class



