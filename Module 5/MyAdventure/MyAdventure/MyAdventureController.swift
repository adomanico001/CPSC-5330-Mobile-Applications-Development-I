//
//  MyAdventureController.swift
//  MyAdventure
//
//  Created by Addie Domanico on 11/17/24.
//

class MyAdventureController {
    private let view: MyAdventureView
    private var currentStep: MyAdventureStep
    
    init(view: MyAdventureView, initialStep: MyAdventureStep) {
        self.view = view
        self.currentStep = initialStep
    }
    
    func startAdventure() {
        while true {
            view.displayStep(currentStep)
            
            guard let options = currentStep.options else {
                view.displayEndMessage(currentStep.description)
                break
            }
            
            guard let userChoice = view.getUserChoice(),
                  userChoice > 0, userChoice <= options.count else {
                view.displayEndMessage("Invalid choice. Please try again.")
                continue
            }
            
            currentStep = options[userChoice - 1]
            
            if currentStep.isSuccessful {
                view.displayEndMessage(currentStep.description)
                break
            } else if currentStep.options == nil {
                view.displayEndMessage(currentStep.description)
                break
            }
        }
    }
}
