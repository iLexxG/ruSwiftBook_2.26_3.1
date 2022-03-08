//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Alex Golyshkov on 08.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    @IBOutlet var loginButton: UIButton!
    @IBOutlet var helpUsernameButton: UIButton!
    @IBOutlet var helpPasswordButton: UIButton!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = usernameTextField.text
    }
    
    @IBAction func actionButtonPressed(_ sender: UIButton) {
        switch sender {
        case loginButton where (usernameTextField.text, passwordTextField.text) != ("User", "Password"):
            showAlert(
                title: "Invalid login or password!",
                message: "Please, enter correct login and password"
            )
            passwordTextField.text = ""
        case helpUsernameButton:
            showAlert(title: "Ooops!", message: "Your name is User")
        case helpPasswordButton:
            showAlert(title: "Ooops!", message: "Your password is Password")
        default:
            performSegue(withIdentifier: "goToWelcomeVC", sender: self)
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: - Private Methods
extension LoginViewController {
    func showAlert(title: String, message: String) {
        let alertMessage = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alertMessage.addAction(okAction)
        present(alertMessage, animated: true)
    }
}
