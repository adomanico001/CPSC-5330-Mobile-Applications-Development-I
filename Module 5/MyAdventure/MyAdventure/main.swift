//
//  main.swift
//  MyAdventure
//
//  Created by Addie Domanico on 11/17/24.
//

import Foundation

let myAdventureView = MyAdventureView()
let myAdventureController = MyAdventureController(view: myAdventureView, initialStep: rootStep)
myAdventureController.startAdventure()
