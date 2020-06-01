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
        
    var numberOfPeople = 2
    var tip: Double = 0.0
    var value: Double = 0.0
    var tipPercentage = 0

  
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
        
        numberOfPeople = Int(sender.value) // Takes steeper value to be used for calculation
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let bills = billTextField.text!
            
        if zeroPcButton.isSelected {
            value = Double(bills)! / Double(numberOfPeople)
            tipPercentage = 0
            
        } else if tenPcButton.isSelected {
            tip = 0.10 * Double(bills)!
            value = (Double(bills)! + tip) / Double(numberOfPeople)
            tipPercentage = 10

        } else if twentyPcButton.isSelected {
            tip = 0.20 * Double(bills)!
            value = (Double(bills)! + tip) / Double(numberOfPeople)
            tipPercentage = 20

        }
        // Goes after calculations are performed
        self.performSegue(withIdentifier: "getResults", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "getResults" {
            // Lets u access class variables by using (as!) forced downcast
            let destination = segue.destination as! ResultsViewController
            destination.amount = value
            destination.numOfPeople = numberOfPeople
            destination.tip = tipPercentage
        }
        
    }
}

