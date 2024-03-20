//
//  ViewController.swift
//  demoProject
//
//  Created by Pankaj on 20/03/24.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        mobileNumberTextField.delegate = self
        // Do any additional setup after loading the view.
    }
}

// MARK: - Text Field Delegate
extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if userNameTextField.text != "" && mobileNumberTextField.text != "" {
            loginButton.isEnabled = true
        }
        return true
    }
}

// MARK: Action Method
extension LoginViewController {
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: String(describing: HomeViewController.self)) as? HomeViewController {
            self.navigationController?.pushViewController(homeViewController, animated: true)
        }
    }
}
