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
    @IBOutlet weak var tgtBullsEye: UILabel!
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = Int(slider.value)
        updateLabels()
        startNewRd()
    }
    
    func updateLabels() {
       tgtBullsEye.text = String(targetValue)
    }
    
    func startNewRd() {
         targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 10
        slider.value = Float(currentValue)
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
        
        let message = "the value of slider is: \(currentValue)" +
        "\nvalue of target is: \(targetValue)"
        
        let alert = UIAlertController(title: "hello world", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRd()
        updateLabels()
    }
    


}

