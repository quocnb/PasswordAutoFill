//
//  LoginViewController.swift
//  PasswordAutoFill
//
//  Created by Quoc Nguyen on 12/27/17.
//  Copyright © 2017 Quoc Nguyen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        enableLoginButton(false)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func login(_ sender: Any) {
        LoginStatus.loggedIn = true
        performSegue(withIdentifier: "LoggedIn", sender: self)
    }

    private func enableLoginButton(_ enable: Bool) {
        loginButton.isEnabled = enable
        loginButton.alpha = enable ? 1.0 : 0.5
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var usernameText = username.text
        var passwordText = password.text
        if let text = textField.text {
            // 3
            let proposed = (text as NSString)
                .replacingCharacters(in: range, with: string)
            if textField == username {
                usernameText = proposed
            } else {
                passwordText = proposed
            }
        }
        // 4
        let isValid = isValidated(username: usernameText,
                                  password: passwordText)
        enableLoginButton(isValid)
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == username {
            password.becomeFirstResponder()
        } else {
            password.resignFirstResponder()
            if isValidated(username: username.text,
                           password: password.text) {
                login(loginButton)
            }
        }
        return false
    }

}
