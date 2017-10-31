//
//  IntroViewController.swift
//  Hangman
//
//  Created by C4Q on 10/28/17.
//  Copyright © 2017 Marcel Chaucer. All rights reserved.
//

import UIKit

//global variables


class IntroViewController: UIViewController {
    //Intro View connections and outlets
    
    @IBOutlet weak var hangmanTitle: UIImageView!
    @IBOutlet weak var startGameButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
