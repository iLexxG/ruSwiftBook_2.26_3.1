//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Alex Golyshkov on 08.03.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
   
    
    // MARK: - IB Outlets
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var helpUsernameButton: UIButton!
    @IBOutlet var helpPasswordButton: UIButton!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting background gradient color
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemCyan.cgColor, UIColor.systemFill.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)

        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        usernameTextField.returnKeyType = UIReturnKeyType.next
        passwordTextField.returnKeyType = UIReturnKeyType.done
        
        passwordTextField.enablesReturnKeyAutomatically = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = usernameTextField.text
    }
    
    // MARK: - IB Actions
    @IBAction func loginButtonTapped() {
        if usernameTextField.text != "User" || passwordTextField.text != "Password" {
            showAlert(
                title: "Invalid login or password!",
                message: "Please, enter correct login and password"
            )
            passwordTextField.text = ""
        } else {
            performSegue(withIdentifier: "goToWelcomeVC", sender: self)
        }
    }
    
    @IBAction func helpButtonTapped(_ sender: UIButton) {
        switch sender {
        case helpUsernameButton:
            showAlert(title: "Ooops!", message: "Your name is \"User\"")
        default:
            showAlert(title: "Ooops!", message: "Your password is \"Password\"")
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Public Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        }
        if textField == passwordTextField {
            loginButtonTapped()
        }
        return true
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
