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
    var number: Int?
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        resultLabel.text = resultLabelTwo
//        rightWordLabel?.isHidden = false
//        winImage?.isHidden = true
        switch number {
        case 1?://win
            resultLabel.text = "You win!"
            winImage.isHidden = false
        case 2?: //lose
            resultLabel.text = "You lose!"
            rightWordLabel.isHidden = false
            rightWordLabel.text = "The secret word was \(rules.secretWord)"
            winImage.isHidden = true
        default:
            break
        }
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        //performing segue back to View Controller
        performSegue(withIdentifier: "playAgainSegue", sender: self)
    }
    //dont need to prepare segue becuase you're not passing any data... just pressing a button
    }

    

    

