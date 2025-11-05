//
//  ViewController.swift
//  IMC-iOS
//
//  Created by Mananas on 3/11/25.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightStepper: UIStepper!
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var weight: Int = 70
    var height: Int = 175
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        weightLabel.text = "\(weight)"
        heightLabel.text = "\(height)"
        
        weightStepper.value = Double(weight)
        heightSlider.value = Float(height)
        
        //calculateBMI()
    }
    
    @IBAction func onChangeWeight(_ sender: UIStepper) {
        weight = Int(sender.value)
        weightLabel.text = "\(weight)"
        //calculateBMI()
    }
    
    @IBAction func onChangeHeight(_ sender: UISlider) {
        height = Int(sender.value)
        heightLabel.text = "\(height)"
        //calculateBMI()
    }
    
    @IBAction func calculateBMI() {
        let heightInMeters = Double(height) / 100.0
        
        let result = Double(weight) / pow(heightInMeters, 2)
        
        resultLabel.text = String(format: "%.2f", result)
    }
}

