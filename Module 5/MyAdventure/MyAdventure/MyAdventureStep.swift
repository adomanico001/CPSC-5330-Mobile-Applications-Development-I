//
//  MyAdventureStep.swift
//  MyAdventure
//
//  Created by Addie Domanico on 11/17/24.
//

struct MyAdventureStep {
    let description: String
    let options: [MyAdventureStep]?
    let isSuccessful: Bool
    
    init(description: String, options: [MyAdventureStep]? = nil, isSuccessful: Bool = false) {
        self.description = description
        self.options = options
        self.isSuccessful = isSuccessful
    }
}

// Fourth Level (Success or Failure)
let cliffFailureStep = MyAdventureStep(description: "You tried to climb the cliff, but slipped and fell. Game over.", isSuccessful: false)
let secretCrystalStep = MyAdventureStep(description: "You found the lost crystal hidden inside a cave at the top of the cliff!", isSuccessful: true)

// Third Level
let raftStep = MyAdventureStep(description: "You successfully crossed the river on your raft. Ahead lies a steep cliff. Do you climb the cliff or search for another path?", options: [cliffFailureStep, secretCrystalStep])
let swimFailureStep = MyAdventureStep(description: "You decided to swim across, but the current swept you away. Game over", isSuccessful: false)

// Second Level
let riverStep = MyAdventureStep(description: "You encounter a deep, roaring river. Do you swim across or build a raft?", options: [swimFailureStep, raftStep])
let boarsFightFailsureStep = MyAdventureStep(description: "You fought the herd of boars bravely but were overwhelmed by their strength. Game over.", isSuccessful: false)
let boarsSuccessStep = MyAdventureStep(description: "You ran away and stumbled upon a secret passage to the lost crystal!", isSuccessful: true)

// First Level
let boarsStep = MyAdventureStep(description: "You encounter a herd of wild boars. Do you fight the herd or run away?", options: [boarsFightFailsureStep, boarsSuccessStep])
                                                                                                        
// Root
let rootStep = MyAdventureStep(description: "You found a treasure map for the Quest of the Lost Dark Crystal. Do you head into the jungle or the mountains?", options: [riverStep, boarsStep])

