//
//  ViewController.swift
//  bullseye
//
//  Created by Jonathan Cochran on 7/23/18.
//  Copyright © 2018 Jonathan Cochran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var rnd = 0
    
    @IBOutlet weak var tgtBullsEye: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var rndLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = Int(slider.value)
        startNewGame()
        
        
    }
    
    func updateLabels() {
       tgtBullsEye.text = String(targetValue)
       scoreLbl.text = String(score)
       rndLbl.text = String(rnd)
    }
    
    func startNewRd() {
         targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 10
        slider.value = Float(currentValue)
        rnd += 1
        updateLabels()
    }
    
    @IBAction func startNewGame() {
        score = 0
        rnd = 0
        startNewRd()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print("the value of the slider is now: \(slider.value)")
        currentValue = Int(slider.value)
    }

    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "almost had it"
            if difference == 1{
                points += 50
            }
        }  else if difference < 10 {
            title = "Pretty good"
        } else {
            title = "not close enough"
        }
        
        score += points
        
        /* longer version of algo will need
            currentValue - targetValue
            if difference < 0 {
            difference = difference * -1
        }*/

        
        let message = "You score \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "awesome", style: .default, handler: {
            action in
            self.startNewRd()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    

}

