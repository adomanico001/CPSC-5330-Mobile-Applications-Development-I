//
//  BMICalculator.swift
//  BonusAssignment
//
//  Created by Addie Domanico on 12/1/24.
//

import Foundation

struct BMICalculator {
    static func calculateBMI(height: Double, weight: Double, isMetric: Bool) -> Double {
        if isMetric {
            return weight / (height * height)
        } else {
            return (weight / (height * height)) * 703
        }
    }
    
    static func getBMICategory(bmi: Double) -> String {
        switch bmi {
        case ..<18.5: return "Underweight"
        case 18.5..<24.9: return "Normal Weight"
        case 25..<29.9: return "Overweight"
        default: return "Obese"
        }
    }
}
