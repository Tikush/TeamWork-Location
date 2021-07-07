//
//  SignUpViewController.swift
//  TeamWork-Location
//
//  Created by Tiko on 07.07.21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    var error = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signupButton(_ sender: Any) {
        
            if ((emailTextField.text?.isEmpty) == true){
                error = "Email is empty"
                showErrorAlert()
            }
            else if ((phoneNumberTextField.text?.isEmpty) == true){
                error = "Phone number is empty"
                showErrorAlert()
            }
            else if ((passwordTextField.text?.isEmpty) == true) {
                error = "Password is empty"
                showErrorAlert()
            }
            
            else {
                UserDefault.createUser(usernameTextField: emailTextField.text!, passwordTextField: passwordTextField.text!)
                navigationController?.popViewController(animated: true)
            }
        }
        func showErrorAlert() {
            let alert = UIAlertController.init(title: "Regisration Failed", message: error, preferredStyle: .alert)
            let Action = UIAlertAction.init(title: "OK", style: .default, handler: nil)
            alert.addAction(Action)
            self.present(alert, animated: true, completion: nil)
        }
    }
