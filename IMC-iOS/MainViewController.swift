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
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var weight: Int = 70
    var height: Int = 175
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        weightLabel.text = "\(weight) kg"
        heightLabel.text = "\(height) cm"
        
        weightStepper.value = Double(weight)
        heightSlider.value = Float(height)
        
        //calculateBMI()
    }
    
    @IBAction func onChangeWeight(_ sender: UIStepper) {
        weight = Int(sender.value)
        weightLabel.text = "\(weight) kg"
        calculateBMI()
    }
    
    @IBAction func onChangeHeight(_ sender: UISlider) {
        height = Int(sender.value)
        heightLabel.text = "\(height) cm"
        calculateBMI()
    }
    
    @IBAction func calculateBMI() {
        let heightInMeters = Double(height) / 100.0
        
        let result = Double(weight) / pow(heightInMeters, 2)
        
        resultLabel.text = String(format: "%.2f", result)
        
        switch result {
        case 0..<18.5:
            descriptionLabel.text = "Underweight"
            descriptionLabel.textColor = UIColor.bmiColorUnderweight
            resultLabel.textColor = UIColor.bmiColorUnderweight
        case 18.5..<25.0:
            descriptionLabel.text = "Normal weight"
            descriptionLabel.textColor = UIColor.bmiColorNormal
            resultLabel.textColor = UIColor.bmiColorNormal
        case 25..<30:
            descriptionLabel.text = "Overweight"
            descriptionLabel.textColor = UIColor.bmiColorOverweight
            resultLabel.textColor = UIColor.bmiColorOverweight
        case 30..<40:
            descriptionLabel.text = "Obesity"
            descriptionLabel.textColor = UIColor.bmiColorObesity
            resultLabel.textColor = UIColor.bmiColorObesity
        default:
            descriptionLabel.text = "Extreme obesity"
            descriptionLabel.textColor = UIColor.bmiColorExtremeObesity
            resultLabel.textColor = UIColor.bmiColorExtremeObesity
        }
    }
}

