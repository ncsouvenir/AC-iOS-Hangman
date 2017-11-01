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
    //Have to set these varibales as Optionals
    var rules = HangmanBrain()
    var resultLabelTwo: String!
    var secretWordReveal: String!
    var happyPerson: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MUST INITIALIZE ALL VARIABLES THAT ARE BEIG SEGUED OVER//
        resultLabel.text = resultLabelTwo
        rightWordLabel.text = secretWordReveal
        winImage.image = happyPerson
    }
    @IBAction func playAgainButton(_ sender: UIButton) {
        //performing segue back to View Controller
        performSegue(withIdentifier: "playAgainSegue", sender: self)
    }
    //dont need to prepare segue becuase you're not passing any data... Just pressing a button.
}





