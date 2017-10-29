//
//  ResultsViewController.swift
//  Hangman
//
//  Created by C4Q on 10/29/17.
//  Copyright © 2017 Marcel Chaucer. All rights reserved.
//



import UIKit

class ResultsViewController: UIViewController {
    //instance of VC
      var gameVC = ViewController()
    //instance of brain
    var rules = HangmanBrain()
    

   //Results View connections and outlets
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var rightWordLabel: UILabel!
    @IBOutlet weak var winImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///Lose Scenario: what needs to happen on the ResultsView
        resultLabel.text = "You Lost!"
        rightWordLabel.text = "The correct word was: \(rules.secretWord)"
        //gameVC.manSevenImage!.isHidden = false
        winImage.isHidden = true
    }
    
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        playAgain()
    }
    
    func playAgain(){
        //hide bodyparts
        gameVC.manOneImage.isHidden = true
        gameVC.manTwoImage.isHidden = true
        gameVC.manThreeImage.isHidden = true
        gameVC.manFourImage.isHidden = true
        gameVC.manFiveImage.isHidden = true
        gameVC.manSixImage.isHidden = true
        gameVC.manSevenImage.isHidden = true
        
        rules.numberOfWrongGuessesLeft = 0
        gameVC.secretWordTextField.clearsOnBeginEditing = true
        gameVC.remainingGuessesLabel.isHidden = true
        gameVC.boardLabel.isHidden = true
        gameVC.gameUpdateLabel.isHidden = true
    }
}
