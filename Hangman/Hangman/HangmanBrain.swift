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
    case used
    //case alreadyGuessed
}
class HangmanBrain {
    enum GameState {
        case victory, lose, ongoing
    }
    //playerOne
    var secretWord: String = ""
    var gameBoardArray = [String]() // ["_", "_" ,"_"]
    var numberOfWrongGuessesLeft = 7
    var usedLetters: [String] = []
    
    ///func for creating secret word and creating board
    func makeGameBoard(from word: String) -> [String]{
        //This sets the empty gameBoard to length of secret word
        for _ in 0..<word.count {
            gameBoardArray.append("_")
        }
        return gameBoardArray
    }
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
            numberOfWrongGuessesLeft -= 1
            usedLetters.append(playerGuess)
            return .wrong
        }
        if usedLetters.contains(playerGuess) {
            return .used
        }
        usedLetters.append(playerGuess)
        return .correct
    }
    ///func for result scenario
    func victoryCheck() -> GameState {
        if numberOfWrongGuessesLeft == 0 {
            return .lose
        }
        if !gameBoardArray.contains("_") {
            return .victory
        }
        return .ongoing
    }
}//end of class



