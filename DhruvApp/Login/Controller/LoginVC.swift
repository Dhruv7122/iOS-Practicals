//
//  LoginVC.swift
//  DhruvApp
//
//  Created by STTL on 23/04/24.
//

import UIKit
import SideMenu

class LoginVC: UIViewController {


    //Outlets
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var toggleBtnPassword: UIButton!
    
    // Main Action
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.text = "dhruv@gmail.com"
        txtEmail.delegate = self
        txtPassword.delegate = self
        txtPassword.text = "12345678"
        toggleBtnPassword.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        
    }

    //show hide password
    @IBAction func TogglePassword(_ sender: UIButton) {
        txtPassword.isSecureTextEntry.toggle()
        sender.isSelected.toggle()
    }
    
    //login btn click action
    @IBAction func LoginOnclick(_ sender: Any) {
        guard let email = txtEmail.text, let password = txtPassword.text,!email.isEmpty,!password.isEmpty else {
            showAlert(title: "Validation Error", message: "Please Enter Email and Password")
            return
        }

        if isValidEmailAndPassword(email,password) {
            UserDefaults.standard.setValue(txtEmail.text, forKey: "UserEmail")
            UserDefaults.standard.setValue(txtPassword.text, forKey: "UserPassword")
            UserDefaults.standard.set(true,forKey: "isLoggedIn")
            Navigation.navigateToOtherController("Dashboard", "DashboardVC", from: self)
        } else {
            showAlert(title: "Validation Error", message: "Invalid Email and Password Format!")
        }
    }
        
    // email validation function
    func isValidEmailAndPassword(_ email: String,_ password: String) -> Bool {
        // Regular expression for email validation
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        // Regular expression for password validation
        // Password must contain at least 8 characters, including at least one uppercase letter, one lowercase letter, and one digit
        let passwordRegex = "^.{8,}$"
        
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        
        if (emailPredicate.evaluate(with: email) && passwordPredicate.evaluate(with: password)) {
            return true
        }else{
            return false
        }
    }
    
    //show alert function
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension LoginVC:UITextFieldDelegate{
    
    // UITextFieldDelegate method to limit text field length
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 30
        guard let currentText = textField.text else { return true }
        let newLength = currentText.count + string.count - range.length
        return newLength <= maxLength
    }
    
}
