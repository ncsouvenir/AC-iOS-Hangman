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


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //playerOne.delegate.self
        //playerTwo.delegate.self
    }
    
    ///text field delegates
    // clears text fields after letter entry
    
    /*
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        <#code#>
    }
     */
    
    // wrong letter: update label and hangman image
    // correct letter: update label
    //already guessed letters
    
    /*
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        <#code#>
    }
     */
    
    //entering only letters a-z
    //can only enter one letter at a time
    //can't delete letters
    
    /*
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        <#code#>
    }
    */
    
    
    
    
    
    

}

