//
//  SignViewController.swift
//  TeamWork-Location
//
//  Created by Tiko on 07.07.21.
//

import UIKit

class SignInViewController: BaseViewController {

  
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var usernameTextField: UITextField!
    

    var error = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    func showError () {
      let alert = UIAlertController.init(title: "Error", message: error, preferredStyle: .alert)
      let okAction = UIAlertAction.init(title: "okay", style: .default, handler: nil)
      alert.addAction(okAction)
      self.present(alert, animated: true, completion: nil)
    }

    @IBAction func signinButton(_ sender: Any) {
        guard let unwrapedUserName = usernameTextField.text else {
           return
          }
          guard let unwrapedPassword = passwordTextField.text else {
           return
          }
        if passwordTextField.text == UserDefault.getPasswordForThisUser(usernameTextField: unwrapedUserName) && !unwrapedPassword.isEmpty {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "TabBar")
            navigationController?.setViewControllers([vc], animated: true)
          }
          else {
            
           error = "Error"
           showError()
          }
    }
   
    @IBAction func signupButton(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "SignupViewController")
            navigationController?.pushViewController(vc, animated: true)
    }

}
