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
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var rightWordLabel: UILabel!
    @IBOutlet weak var winImage: UIImageView!
    
    var rules = HangmanBrain()
    
    var resultLabelTwo: String!
    var correctWord: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = resultLabelTwo
        rightWordLabel.isHidden = true
        winImage.isHidden = true
        rightWordLabel.text = "The secret word was \(rules.secretWord)"
    }
    
    
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        //perform segue
        performSegue(withIdentifier: "playAgainSegue", sender: self)
    }
    
    
    
    //dont need to prepare segue becuase you're not passing any data... just pressing a button
    
}
