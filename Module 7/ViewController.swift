//
//  ViewController.swift
//  Module7Assignment
//
//  Created by Addie Domanico on 11/30/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var recipes = [
        "Stir-fry Noodles",
        "Soy Sauce",
        "Sesame Oil",
        "Brown Sugar",
        "Chicken",
        "Snow Peas",
        "Carrots",
        "Broccoli",
        "Water Chestnuts",
        "Sesame Seeds"
    ]
    
    var selectedRecipe: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { _ in
            self.tableView.setNeedsLayout()
            self.tableView.layoutIfNeeded()
        })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.contentInsetAdjustmentBehavior = .automatic
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        cell.textLabel?.text = recipes[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRecipe = recipes[indexPath.row]
        performSegue(withIdentifier: "toNavigation", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNavigation" {
            if let destinationVC = segue.destination as? SecondViewController {
                destinationVC.recipeText = selectedRecipe
            }
        }
    }
}

struct Recipe {
    var recipe: String
    init(_ recipe: String) {
        self.recipe = recipe
    }
}
