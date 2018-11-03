//
//  ViewController.swift
//  Guess the Flag
//
//  Created by Bernard Ventura on 11/3/18.
//  Copyright © 2018 Bernard Ventura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    Button1.layer.borderWidth = 1
    Button2.layer.borderWidth = 1
    Button3.layer.borderWidth = 1
    
    Button1.layer.borderColor = UIColor.lightGray.cgColor
    Button2.layer.borderColor = UIColor.lightGray.cgColor
    Button3.layer.borderColor = UIColor.lightGray.cgColor
    
    countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    // askQuestion()
    askQuestion(action: nil)
    
    }
    
    
    // func askQuestion() {
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        Button1.setImage(UIImage(named: countries[0]), for: .normal)
        Button2.setImage(UIImage(named: countries[1]), for: .normal)
        Button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
        
        
    }
    @IBAction func buttonTapped(_ sender: Any) {
        
        var title: String
        
        if (sender as AnyObject).tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
    
    let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        
    }
    

}

