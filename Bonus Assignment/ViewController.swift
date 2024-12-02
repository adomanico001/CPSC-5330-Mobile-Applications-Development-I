//
//  ViewController.swift
//  BonusAssignment
//
//  Created by Addie Domanico on 12/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var unitSegmentedControl: UISegmentedControl!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func calculateBMI(_ sender: UIButton) {
        guard let heightText = heightTextField.text, let weightText = weightTextField.text,
              let height = Double(heightText), let weight = Double(weightText) else {
            showAlert(message: "Please enter valid numbers for height and weight.")
            return
        }
        
        let isMetric = unitSegmentedControl.selectedSegmentIndex == 0
        
        let bmi = BMICalculator.calculateBMI(height: height, weight: weight, isMetric: isMetric)
        
        performSegue(withIdentifier: "toResultsScreen", sender: bmi)
    }
    
    @IBAction func resetFields(_ sender: UIButton) {
        heightTextField.text = ""
        weightTextField.text = ""
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultsScreen", let destinationVC = segue.destination as? ResultsViewController {
            if let bmi = sender as? Double {
                destinationVC.bmi = bmi
            }
        }
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
