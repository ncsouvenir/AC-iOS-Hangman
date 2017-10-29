//
//  HangmanBrain.swift
//  Hangman
//
//  Created by C4Q on 10/28/17.
//  Copyright © 2017 Marcel Chaucer. All rights reserved.
//

import Foundation

enum GameState {
    case win, lose
}

enum GameStateUpdate {
    case correct
    case wrong(Player)
    case alreadyGuessed
}

enum Player {
    case one, two
}



//playerOne
let secretWord: String = ""
//playerTwo
var playerTwoGuess: String = ""
var gameBoardArray = [String]() // ["_", "_" ,"_"]
var numberOfGuessesLeft = 0

class HangmanBrain {


    ///func for creating secret word and creating board
    func makeGameBoard() -> [String] {
        //This sets the empty gameBoard to length of secret word
        for _ in 0..<secretWord.count {
            gameBoardArray.append("_")
        }
        return gameBoardArray
    }
}


///func for guessing letter
func guessingLetter(_ str: String) -> GameStateUpdate{
    //correct
    if secretWord.contains(playerTwoGuess){
        //updatesBoard
        guessLoop: for letter in 0..<secretWord.count {
            if playerTwoGuess == String(secretWord[secretWord.index(secretWord.startIndex, offsetBy: letter)]) {
                gameBoardArray[letter] = playerTwoGuess
            }
            return .correct
        }
    }else{
        //wrong
        numberOfGuessesLeft += 1
        return .wrong(.two)
    }
    
    //alreadyGuessed
    if gameBoardArray.contains(playerTwoGuess){
        return .alreadyGuessed
    }
    return .wrong(.two)
}





///func for result scenario

func victoryCheck() -> GameState{
    //lose
    if numberOfGuessesLeft == 7 {
        return .lose
    } else if !gameBoardArray.isEmpty{
        //victory: is not empty
        return .win
    }
    return .win
}

//if the board is not empty
//orrr
// winning word == secret word







