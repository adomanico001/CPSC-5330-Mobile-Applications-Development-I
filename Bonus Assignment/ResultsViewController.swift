//
//  SecondViewController.swift
//  BonusAssignment
//
//  Created by Addie Domanico on 12/1/24.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var bmi: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let bmi = bmi {
            bmiLabel.text = String(format: "BMI: %.2f", bmi)
            categoryLabel.text = BMICalculator.getBMICategory(bmi: bmi)
        }
    }
}
