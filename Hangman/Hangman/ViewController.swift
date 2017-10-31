//
//  ViewController.swift
//  Hangman
//
//  Created by Marcel Chaucer on 10/18/17.
//  Copyright © 2017 Marcel Chaucer. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITextFieldDelegate {
    
    //Main View connections and outlets
    @IBOutlet weak var secretWordTextField: UITextField!
    @IBOutlet weak var letterTextField: UITextField!
    @IBOutlet weak var letterEnterLabel: UILabel!
    @IBOutlet weak var boardLabel: UILabel!
    @IBOutlet weak var gameUpdateLabel: UILabel!
    @IBOutlet weak var usedLettersLabel: UILabel!
    
    ///bodyparts
    @IBOutlet weak var hangmanPostImage: UIImageView!
    @IBOutlet weak var hangmanImage: UIImageView!
    //instances for other View Controllers
    var rules = HangmanBrain()
    var endPage = ResultsViewController()
    var myImageView = UIImageView()
    
    override func viewDidLoad(){
        playAgain()
        super.viewDidLoad()
        hangmanImage.isHidden = false
        hangmanPostImage.isHidden = false
        letterEnterLabel.text = "Enter a letter:"
        gameUpdateLabel.isHidden = true
        boardLabel.isHidden = true
        letterTextField.isUserInteractionEnabled = true
        //delegate set-up
        secretWordTextField.delegate = self
        letterTextField.delegate = self
    }
    //        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    //            //can only enter a-z
    //            let characterSet = CharacterSet.letters
    //            if string.rangeOfCharacter(from: characterSet.inverted) != nil {
    //                return false
    //            }
    //
    ////            if textField == letterTextField {
    ////                guard string.count == 1, letterTextField.text!.count < 1 else {
    ////                    return false
    ////                }
    ////            }
    //            return true
    //        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //make sure that the text field has something in ti otherwise don't run
        guard let text = textField.text  else {
            return false
        }
        //if textField == the secret word entered in...
        if textField == secretWordTextField {
            let board = rules.makeGameBoard(from: text)
            boardLabel.isHidden = false
            boardLabel.text = board.joined(separator: " ")
            rules.secretWord = text
            secretWordTextField.isEnabled = false
        }
        if textField == letterTextField {
            switch rules.getGuessedLetter(from: text) {
            case .alreadyUsed:
                gameUpdateLabel.isHidden = false
                gameUpdateLabel.text = "\"\(text)\" already chosen."
                textField.resignFirstResponder()
                return false //prevents user from entering this letter
            case .correct:
                let updatedGameBoard = rules.updateGameBoardArray(text)
                boardLabel.text = updatedGameBoard.joined(separator:" ")
                usedLettersLabel.isHidden = false
                gameUpdateLabel.isHidden = false
                gameUpdateLabel.text = "Correct! Guess another letter."
                usedLettersLabel.text = "used letters: \"\(text)\""
                textField.resignFirstResponder()
            case .wrong:
                switch rules.numberOfWrongGuessesLeft {
                case 6:
                    hangmanImage.image = #imageLiteral(resourceName: "man1")
                case 5:
                    hangmanImage.image = #imageLiteral(resourceName: "man2")
                case 4:
                    hangmanImage.image = #imageLiteral(resourceName: "man3")
                case 3:
                    hangmanImage.image = #imageLiteral(resourceName: "man4")
                case 2:
                    hangmanImage.image = #imageLiteral(resourceName: "man5")
                case 1:
                    hangmanImage.image = #imageLiteral(resourceName: "man6")
                case 0:
                    hangmanImage.image = #imageLiteral(resourceName: "man7")
                default:
                    break
                }
                textField.resignFirstResponder()
                gameUpdateLabel.isHidden = false
                gameUpdateLabel.text = "Wrong! \(rules.numberOfWrongGuessesLeft) guesses left"
            }
            switch rules.victoryCheck(){
            case .victory:
                gameUpdateLabel.text = "victory"
                performSegue(withIdentifier: "winOrLoseSegue", sender: self)
            case .defeat:
                letterTextField.isUserInteractionEnabled = false
                gameUpdateLabel.text = "defeat"
                performSegue(withIdentifier: "winOrLoseSegue", sender: self)
            case .ongoing:
                return true
            }
            letterTextField.text = ""
            textField.resignFirstResponder()
        }
        return true
    } //end return func
    func playAgain(){
        hangmanImage.isHidden = true
        letterTextField.isUserInteractionEnabled = false
        usedLettersLabel.text = "used letters: "
        usedLettersLabel.isHidden = true
        rules.numberOfWrongGuessesLeft = 7
        secretWordTextField.clearsOnBeginEditing = true
        boardLabel.isHidden = true
        gameUpdateLabel.isHidden = true
        secretWordTextField.isEnabled = true
    }
    //preparing segue to ResultsViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultsViewController = segue.destination as? ResultsViewController{
            //passing data over to ResultsViewController
            if gameUpdateLabel.text == "victory"{
                resultsViewController.resultLabelTwo = "You win!"
            } else {
                resultsViewController.resultLabelTwo = "You lose!"
                resultsViewController.correctWord = "The secret word was \(rules.secretWord)"
                //resultsViewController.rightWordLabel.text = "The secret word was \(rules.secretWord)"
            }
        }
    }
}//end of VC Class

