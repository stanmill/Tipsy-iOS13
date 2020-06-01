//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }

    // Handles tip values
    @IBAction func tipChanged(_ sender: UIButton) {
        // Reset button state
        zeroPcButton.isSelected = false
        tenPcButton.isSelected = false
        twentyPcButton.isSelected = false
        
        sender.isSelected = true
          billTextField.endEditing(true) // Hides keyboard when user clicks a tip

    }
    
    // Handles the change in the number of users split
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        let numberOfPeople = String(format: "%.0f", sender.value)
        splitNumberLabel.text = numberOfPeople
        
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let tip: Double

        
        print(billTextField.text!) // Full value
        if zeroPcButton.isSelected {
//            let value = Double(billTextField.text!) / Double(splitNumberLabel.text!)
            print(0.0)
        } else if tenPcButton.isSelected {
            print(0.1)
        } else if twentyPcButton.isSelected {
            print(0.2)
        }
    }
}

