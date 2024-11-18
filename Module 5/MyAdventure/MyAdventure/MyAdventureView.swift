//
//  MyAdventureView.swift
//  MyAdventure
//
//  Created by Addie Domanico on 11/17/24.
//

class MyAdventureView {
    func displayStep(_ step: MyAdventureStep) {
        print("\n" + step.description)
        if let options = step.options {
            for (index, _) in options.enumerated() {
                print("\(index + 1). \(getOptionDescription(for: step, at: index))")
            }
        }
    }
    
    func getUserChoice() -> Int? {
        print("\nEnter your choice: ", terminator: "")
        return Int(readLine() ?? "")
    }
    
    func displayEndMessage(_ message: String) {
        print("\n\(message)")
    }
    
    private func getOptionDescription(for step: MyAdventureStep, at index: Int) -> String {
        switch step.description {
        case "You found a treasure map for the Quest of the Lost Dark Crystal. Do you head into the jungle or the mountains?":
            return index == 0 ? "Do you head into the jungle?" : "Do you head into the mountains?"
        case "You encounter a deep, roaring river. Do you swim across or build a raft?":
            return index == 0 ? "Swim across" : "Build a raft"
        case "You encounter a herd of wild boars. Do you fight the herd or run away?":
            return index == 0 ? "Fight the herd of boars" : "Run away"
        default:
            return "Option \(index + 1)"
        }
    }
}
