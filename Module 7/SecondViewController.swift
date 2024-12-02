//
//  SecondViewController.swift
//  Module7Assignment
//
//  Created by Addie Domanico on 11/30/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    var recipeText: String?
    
    @IBOutlet weak var recipeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        recipeLabel.text = recipeText
    }
}
