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
    
    @IBOutlet weak var remainingGuessesLabel: UILabel!
    @IBOutlet weak var letterEnterLabel: UILabel!
    @IBOutlet weak var boardLabel: UILabel!
    @IBOutlet weak var gameUpdateLabel: UILabel!
    
    ///bodyparts
    @IBOutlet weak var hangmanPostImage: UIImageView!
    @IBOutlet weak var manOneImage: UIImageView!
    @IBOutlet weak var manTwoImage: UIImageView!
    @IBOutlet weak var manThreeImage: UIImageView!
    @IBOutlet weak var manFourImage: UIImageView!
    @IBOutlet weak var manFiveImage: UIImageView!
    @IBOutlet weak var manSixImage: UIImageView!
    @IBOutlet weak var manSevenImage: UIImageView!
    
    //instance of brain
    var rules = HangmanBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manOneImage.isHidden = true
        manTwoImage.isHidden = true
        manThreeImage.isHidden = true
        manFourImage.isHidden = true
        manFiveImage.isHidden = true
        manSixImage.isHidden = true
        manSevenImage.isHidden = true
        
        hangmanPostImage.isHidden = false
        remainingGuessesLabel.isHidden = true
        letterEnterLabel.text = "Enter a letter:"
        gameUpdateLabel.isHidden = true
        boardLabel.isHidden = true
        boardLabel.isHidden = true
        //        secretWordTextField.delegate.self
        //        letterTextField.delegate.self
    }
    
/////text field delegates
        /// clears text fields after letter entry
//     func textFieldShouldClear(_ textField: UITextField) -> Bool {
//     }
//
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //once p1 enters word,gameboard will appear
        boardLabel.isHidden = false
        
        ///switching on win or loss
        //        switch rules.GameState{
        //        case .victory:
        //            //go to results view controller...do later
        //        case .lose:
                    /// instantiation and presenting will go under this case. This is the lose scenario logic from my HangManBrain.swift file. Only working with losing scenario right now until it works.
        
        /// When the users guess ==  numberOfGuessesLeft(7) (that code is in HangManBrain.swift file), instantiate resultsViewController in Code and “present” it
        
        ///not exactly sure if this goes here or in my results view controller?
        
        ///instantiating ResultsViewController: need to unwrap?
        //1: create constant variable using storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //2: create constant for ResultsViewController --> used to navigate to that VC
        let resultsViewController = storyboard.instantiateViewController(withIdentifier :"ResultsViewController") as! ResultsViewController
        self.present(resultsViewController, animated: true, completion: nil)
        //        }
        
        
        ///switching on player two's guess
        //        switch rules.playerTwoGuess{
        //        case .correct(.two):
        //            // correct letter and update label
        //            gameUpdateLabel.isHidden = false
        //            gameUpdateLabel.text = "Correct. Guess another letter."
        //
        //        case .wrong(.two):
        //            // wrong letter: update label and hangman image
        //            remainingGuessesLabel.isHidden = false
        //            remainingGuessesLabel.text = "Guesses left: \(rules.numberOfGuessesleft)"
        //            gameUpdateLabel.isHidden = false
        //            gameUpdateLabel.text = "Wrong!\(rules.numberOfGuessesLeft) guesses left"
        //           drawHangman()
        //        case .alreadyGuessed(.two):
        //            gameUpdateLabel.isHidden = false
        //            gameUpdateLabel.text = "Letter already guessed."
        //        }
        resignFirstResponder()
        return true
    }
    
    
//     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//     //entering only letters a-z
//     //can only enter one letter at a time
//     //can't delete letters
//
//     }
 
    
    ///func for drawing hangman
    //    func drawHangman() -> UIImageView {
    //        if (rules.numberOfWrongGuessesLeft == 1) {
    //            return manSevenImage
    //        }
    //        if (rules.numberOfWrongGuessesLeft == 2) {
    //            return manSixImage
    //        }
    //        if (rules.numberOfWrongGuessesLeft == 3) {
    //            return manFiveImage
    //        }
    //        if (rules.numberOfWrongGuessesLeft == 4) {
    //            return manFourImage
    //        }
    //        if (rules.numberOfWrongGuessesLeft == 5) {
    //            return manThreeImage
    //        }
    //        if (rules.numberOfWrongGuessesLeft == 6) {
    //            return manTwoImage
    //        }
    //    }
    
}
