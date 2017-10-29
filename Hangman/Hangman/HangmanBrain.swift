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
    case alreadyGuessed
}

enum Player {
    case one, two
}

class HangmanBrain {
    enum GameState {
        case victory, lose, ongoing
    }

    //playerOne
    let secretWord: String = ""
    //playerTwo
    var playerTwoGuess: String = ""
    var gameBoardArray = [String]() // ["_", "_" ,"_"]
    var numberOfWrongGuessesLeft = -1
    
    ///func for creating secret word and creating board
    func makeGameBoard(from word: String) -> [String] {
        //This sets the empty gameBoard to length of secret word
        for _ in 0..<word.count {
            gameBoardArray.append("_")
        }
        return gameBoardArray
    }
    
    ///func for guessing letter
    func getGuessedLetter(from playerGuess: String) -> GameStateUpdate{
        //already guessed check
        if gameBoardArray.contains(playerTwoGuess) {
            return.alreadyGuessed
        }
        //correct and wrong letter check
        if secretWord.contains(playerTwoGuess){
            //updates board
            for letter in 0..<secretWord.count {
                if playerTwoGuess == String(secretWord[secretWord.index(secretWord.startIndex, offsetBy: letter)]) {
                    gameBoardArray[letter] = playerTwoGuess
                }
            }
            return .correct
        } else if !secretWord.contains(playerTwoGuess){
            numberOfWrongGuessesLeft -= 1
            return .wrong
        }
       
        return .correct
    }
    
 
    ///func for result scenario
    func victoryCheck() -> GameState{
//        if gameBoardArray.contains(secretWord){
//            return .win
//        }
        if !gameBoardArray.contains("_") {
            print("Win!")
            return .victory
        }
        if numberOfWrongGuessesLeft == -1{
            print("Lost!")
            return .lose
        }
        return .victory
    }
    
}//end of class

//if the board is not empty
//orrr
// winning word == secret word


//    func getCorrectLetter(for hiddenWord: String) -> GameStateUpdate{
//        if secretWord.contains(playerTwoGuess){
//            //updatesBoard
//             for letter in 0..<secretWord.count {
//                if playerTwoGuess == String(secretWord[secretWord.index(secretWord.startIndex, offsetBy: letter)]) {
//                    gameBoardArray[letter] = playerTwoGuess
//                }
//            }
//        }
//        return .correct
//    }
//
//    func getWrongLetter(for hiddenWord: String) -> GameStateUpdate{
//        if !secretWord.contains(playerTwoGuess){
//            numberOfWrongGuessesLeft += 1
//        }
//        return .wrong
//    }
//
//    func getAlreadyGuessedletter(for hiddenWord: String) -> GameStateUpdate{
//        if gameBoardArray.contains(playerTwoGuess) {
//            return.alreadyGuessed
//        }
//       return .alreadyGuessed
//    }




