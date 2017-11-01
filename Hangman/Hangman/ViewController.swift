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
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //can only enter letters a-z
        let characterSet = CharacterSet.letters
        if string.rangeOfCharacter(from: characterSet.inverted) != nil {
            return false
        }
        //cannot delete a letter once it has been entered
        //cannot enter more than one letter
        if textField == letterTextField {
            guard string.count == 1, letterTextField.text!.count < 1 else {
                return false
            }
        }
        //restricting letter input to keyboard if player has already guessed the letter
        if textField == letterTextField {
            if rules.usedLettersArray.contains(string){
                return false
            }
        }
        return true
    }
    //clears letter textfield upon clicking on textfield
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == letterTextField {
            letterTextField.text = ""
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //make sure that the text field has something in ti otherwise don't run
        guard let text = textField.text  else {
            return false
        }
        //if textField == the secret word entered in...
        if textField == secretWordTextField {
            let board = rules.makeGameBoard(from: text.lowercased())
            boardLabel.isHidden = false
            boardLabel.text = board.joined(separator: " ")
            rules.secretWord = text.lowercased()
            secretWordTextField.isEnabled = false
        }
        if textField == letterTextField {
            switch rules.getGuessedLetter(from: text.lowercased()) {
            case .alreadyUsed:
                gameUpdateLabel.isHidden = false
                gameUpdateLabel.text = "\"\(text)\" already chosen."
                textField.resignFirstResponder()
                return false //prevents user from entering this letter
            case .correct:
                let updatedGameBoard = rules.updateGameBoardArray(text.lowercased())
                boardLabel.text = updatedGameBoard.joined(separator:" ")
                gameUpdateLabel.isHidden = false
                gameUpdateLabel.text = "Correct! Guess another letter."
                usedLettersLabel.isHidden = false
                //rules.usedLettersArray.append(text)
                
                ///here I am creating an instance of the function and calling it 
                let usedLetters = rules.appendToUsedLettersArray(from: text.lowercased())
                usedLettersLabel.text = usedLetters.joined(separator: " ")
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
                usedLettersLabel.isHidden = false
                //rules.usedLettersArray.append(text)
                let usedLetters = rules.appendToUsedLettersArray(from: text.lowercased())
                usedLettersLabel.text = usedLetters.joined(separator: " ")
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
    var buttonHidden = false
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultsViewController = segue.destination as? ResultsViewController{
            //passing data over to ResultsViewController
            if gameUpdateLabel.text == "victory"{
                resultsViewController.resultLabelTwo = "You win!"
                resultsViewController.winImage?.isHidden = false
                resultsViewController.rightWordLabel?.isHidden = true
            } else {
                resultsViewController.resultLabelTwo = "You lose! The secret word was \(rules.secretWord)"
                resultsViewController.rightWordLabel?.isHidden = false
                //resultsViewController.rightWordLabel?.text = "The secret word was \(rules.secretWord)"
                resultsViewController.winImage?.isHidden = true
            }
        }
    }
}//end of VC Class

