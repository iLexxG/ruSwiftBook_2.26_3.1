//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Alex Golyshkov on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(userName ?? "")!"
    }
    @IBAction func signoutButtonPressed() {
        dismiss(animated: true)
    }
}
