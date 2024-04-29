//
//  Validation.swift
//  DhruvApp
//
//  Created by STTL on 12/04/24.
//

import UIKit

class Validation: UIViewController {

    // email validation function
    //Params : (email, password)
    func isValidEmailAndPassword(_ email: String,_ password: String) -> Bool {
        // Regular expression for email validation
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        // Regular expression for password validation
        // Password must contain at least 8 characters, including at least one uppercase letter, one lowercase letter, and one digit
        let passwordRegex = "^.{8,}$"
        
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        
        
        if !email.isEmpty && emailPredicate.evaluate(with: email){
            if !password.isEmpty && passwordPredicate.evaluate(with: password){
                return true
            }else {
                showAlert(title: "Validation Error", message: "Password Must Be 8 char Long")
                return false
            }
        }else {
            showAlert(title: "Validation Error", message: "Invalid Email")
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
