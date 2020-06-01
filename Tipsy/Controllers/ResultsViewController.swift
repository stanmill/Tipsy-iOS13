//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by stanley pena on 5/31/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var amount: Double?
    var numOfPeople: Int?
    var message: String?
    var tip: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(format: "%.2f", amount!)
        settingsLabel.text = "Split between \(numOfPeople!) people, with \(tip ?? 0)%"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        // Goes back to previous screen
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destination.
         Pass the selected object to the new view controller.
    }
    */

}
