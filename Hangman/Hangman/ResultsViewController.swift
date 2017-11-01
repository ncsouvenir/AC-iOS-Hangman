//
//  ResultsViewController.swift
//  Hangman
//
//  Created by C4Q on 10/29/17.
//  Copyright © 2017 Marcel Chaucer. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    //Results View connections and outlets
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel! //you win or you lose
    @IBOutlet weak var rightWordLabel: UILabel!
    @IBOutlet weak var winImage: UIImageView!
    
    var rules = HangmanBrain()
    var resultLabelTwo: String!
    var correctWord: String!
    //var number: Int =  nil
    
////MUST INITIALIZE ALL VARIABLES THAT ARE BEIG SEGUED OVER
    var buttonHidden = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = resultLabelTwo
        rightWordLabel.text = "The correct word was "
        rightWordLabel?.isHidden = false
        winImage.image = #imageLiteral(resourceName: "winImage")
    }
    @IBAction func playAgainButton(_ sender: UIButton) {
        //performing segue back to View Controller
        performSegue(withIdentifier: "playAgainSegue", sender: self)
    }
    //dont need to prepare segue becuase you're not passing any data... just pressing a button
    }

    

    

