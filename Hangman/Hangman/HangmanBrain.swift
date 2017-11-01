//
//  HangmanBrain.swift
//  Hangman
//
//  Created by C4Q on 10/28/17.
//  Copyright © 2017 Marcel Chaucer. All rights reserved.
//
import Foundation

enum GameStateUpdate {
    case correct, wrong, alreadyUsed
}
class HangmanBrain {
    enum GameState {
        case victory, defeat, ongoing
    }
    var secretWord: String = ""
    var gameBoardArray = [String]() // ["_", "_" ,"_"]
    var usedLettersArray: [String] = []
    var numberOfGuessesLeft = 7
    
    ///func for creating secret word
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
    ///func that appends letters guessed into usedLettersArray
    func appendToUsedLettersArray(from playerGuess: String) -> [String]{
        for _ in 0..<playerGuess.count {
            if !gameBoardArray.contains(playerGuess) || gameBoardArray.contains(playerGuess){
                usedLettersArray.append(playerGuess)
            }
        }
        return usedLettersArray
    }
    ///func for guessing letter
    func getGuessedLetter(from playerGuess: String) -> GameStateUpdate {
        //correct and wrong letter check
        if !secretWord.contains(playerGuess){
            numberOfGuessesLeft -= 1
            return .wrong
        }
        if usedLettersArray.contains(playerGuess) {
            return .alreadyUsed
        }
        print(playerGuess)
        return .correct
    }
    ///func for result scenario
    func victoryCheck() -> GameState {
        if numberOfGuessesLeft == 0 {
            return .defeat
        }
        if !gameBoardArray.contains("_") {
            return .victory
        }
        return .ongoing
    }
}//end of class




