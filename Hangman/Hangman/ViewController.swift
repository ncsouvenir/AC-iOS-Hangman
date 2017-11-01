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
    @IBOutlet weak var secretWordTextField: UITextField!// player one
    @IBOutlet weak var PlayerTwoTextField: UITextField! //player two
    @IBOutlet weak var letterEnterLabel: UILabel!
    @IBOutlet weak var boardLabel: UILabel!
    @IBOutlet weak var gameStateUpdateLabel: UILabel!
    @IBOutlet weak var usedLettersLabel: UILabel!
    ///bodyparts
    @IBOutlet weak var hangmanPostImage: UIImageView!
    @IBOutlet weak var hangmanImage: UIImageView!
    //instances for other View Controllers
    var rules = HangmanBrain()
    var myImageView = UIImageView()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        playAgain()
        hangmanImage.isHidden = false
        hangmanPostImage.isHidden = false
        gameStateUpdateLabel.isHidden = true
        boardLabel.isHidden = true
        PlayerTwoTextField.isUserInteractionEnabled = true
        letterEnterLabel.text = "Enter a letter:"
        //delegate set-up
        secretWordTextField.delegate = self
        PlayerTwoTextField.delegate = self
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //can only enter letters a-z
        let characterSet = CharacterSet.letters
        if string.rangeOfCharacter(from: characterSet.inverted) != nil {
            return false
        }
        //cannot delete a letter once it has been entered
        //cannot enter more than one letter
        if textField == PlayerTwoTextField {
            guard string.count == 1, PlayerTwoTextField.text!.count < 1 else {
                return false
            }
        }
        //restricting letter input to keyboard if player has already guessed the letter
        if textField == PlayerTwoTextField {
            if rules.usedLettersArray.contains(string){
                return false
            }
        }
        return true
    }
    //clears letter textfield upon clicking on textfield
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == PlayerTwoTextField {
            PlayerTwoTextField.text = ""
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
        if textField == PlayerTwoTextField {
            switch rules.getGuessedLetter(from: text.lowercased()) {
            case .alreadyUsed:
                gameStateUpdateLabel.isHidden = false
                gameStateUpdateLabel.text = "\"\(text)\" already chosen."
                textField.resignFirstResponder()
                return false //prevents user from entering this letter
            case .correct:
                let updatedGameBoard = rules.updateGameBoardArray(text.lowercased())
                boardLabel.text = updatedGameBoard.joined(separator:" ")
                gameStateUpdateLabel.isHidden = false
                gameStateUpdateLabel.text = "Correct! Guess another letter."
                usedLettersLabel.isHidden = false
                let usedLetters = rules.appendToUsedLettersArray(from: text.lowercased())
                usedLettersLabel.text = usedLetters.joined(separator: " ")
                textField.resignFirstResponder()
            case .wrong:
                switch rules.numberOfGuessesLeft {
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
                gameStateUpdateLabel.isHidden = false
                gameStateUpdateLabel.text = "Wrong! \(rules.numberOfGuessesLeft) guesses left"
                usedLettersLabel.isHidden = false
                //rules.usedLettersArray.append(text)
                let usedLetters = rules.appendToUsedLettersArray(from: text.lowercased())
                usedLettersLabel.text = usedLetters.joined(separator: " ")
            }
            switch rules.victoryCheck(){
            case .victory:
                gameStateUpdateLabel.text = "victory"
                performSegue(withIdentifier: "winOrLoseSegue", sender: self)
            case .defeat:
                PlayerTwoTextField.isUserInteractionEnabled = false
                gameStateUpdateLabel.text = "defeat"
                performSegue(withIdentifier: "winOrLoseSegue", sender: self)
            case .ongoing:
                return true
            }
            PlayerTwoTextField.text = ""
            textField.resignFirstResponder()
        }
        return true
    } //end textfield return func
    func playAgain(){
        hangmanImage.isHidden = true
        PlayerTwoTextField.isUserInteractionEnabled = false
        usedLettersLabel.text = "used letters: "
        usedLettersLabel.isHidden = true
        rules.numberOfGuessesLeft = 7
        secretWordTextField.clearsOnBeginEditing = true
        boardLabel.isHidden = true
        gameStateUpdateLabel.isHidden = true
        secretWordTextField.isEnabled = true
    }
    //FIRST SEGUE!!
    //preparing segue to ResultsViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultsViewController = segue.destination as? ResultsViewController{
            //passing data over to ResultsViewController
            if gameStateUpdateLabel.text == "victory"{
                resultsViewController.resultLabelTwo = "You win!"
                resultsViewController.secretWordReveal = "The word was \"\(rules.secretWord)\""
                resultsViewController.happyPerson = #imageLiteral(resourceName: "winImage")
            } else {
                resultsViewController.resultLabelTwo = "You lose!"
                resultsViewController.secretWordReveal = "The word was \"\(rules.secretWord)\""
            }
        }
    }
}//end of VC Class
