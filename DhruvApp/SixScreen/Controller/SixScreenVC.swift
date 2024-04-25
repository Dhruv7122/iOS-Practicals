//
//  SixScreenVC.swift
//  DhruvApp
//
//  Created by STTL on 11/04/24.
//

import UIKit

class SixScreenVC: UIViewController {

    // Outlets
    @IBOutlet weak var lblOR: UIView!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var togglePassword: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtOTP: UITextField!
    @IBOutlet weak var btnRemember: UIButton!
    
    // Main Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtOTP.delegate = self
        
        // Securing password Entry
        txtPassword.isSecureTextEntry = true
        
        //Border for Or Label
        BorderFactory.addBorder(to: lblOR, cornerRadius: 5.0, borderColor: UIColor.darkGray, borderWidth: 1.0)
        
        // Set UnderLined string to button title for normal state
        AttributedString.underlineButton(btnSignUp, "SIGNUP")
        
        // ckeck User Defaults Values
        // set values if available in User Defaults
        if let email = UserDefaults.standard.string(forKey: "UserEmail") , let password = UserDefaults.standard.string(forKey: "UserPassword"){
            txtEmail.text = email
            txtPassword.text = password
            btnRemember.isSelected = true
        }
    }

    // Toggle Password Action
    @IBAction func togglePasswordAction(_ sender: UIButton) {
        txtPassword.isSecureTextEntry.toggle()
        sender.isSelected.toggle()
    }
    
    // Clear Form Action
    @IBAction func btnClearAction(_ sender: Any) {
        txtPassword.text = ""
        txtEmail.text = ""
        txtOTP.text = ""
        btnRemember.isSelected = false
    }
    
    // Remember Btn Action
    @IBAction func btnRememberClickAction(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    // Login Btn Click Action
    @IBAction func btnLoginClick(_ sender: Any) {
        
        let email = txtEmail.text
        let password = txtPassword.text
        let OTP = txtOTP.text
        
        // check if email and password are not empty
        if isValidEmailAndPasswordAndOTP(email!, password! , OTP!) {
            
            // check btnRemember State
            // set Email and Password to User Defaults if true
            if btnRemember.isSelected {
                UserDefaults.standard.setValue(txtEmail.text, forKey: "UserEmail")
                UserDefaults.standard.setValue(txtPassword.text, forKey: "UserPassword")
            }else if !btnRemember.isSelected{
                UserDefaults.standard.removeObject(forKey: "UserEmail")
                UserDefaults.standard.removeObject(forKey: "UserPassword")
            }
            
            // navigate to other StoryBoard
            Navigation.navigateToOtherController("HomeSix", "HomeSixVC", from: self)
        }
    }
    
    // back Btn Click Action
    @IBAction func btnBackClickAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //show alert function
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // email,password,OTP validation function
    func isValidEmailAndPasswordAndOTP(_ email: String,_ password: String ,_ OTP:String) -> Bool {
        // Regular expression for email validation
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        // Regular expression for password validation
        // Password must contain at least 8 characters, including at least one uppercase letter, one lowercase letter, and one digit
        let passwordRegex = "^.{8,}$"
        
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        
        let OTPRegex = "\\b\\d{4}\\b"
        
        let OTPPredicate = NSPredicate(format: "SELF MATCHES %@", OTPRegex)
        
        // check email,password,otp
        if !email.isEmpty && emailPredicate.evaluate(with: email){
            if !password.isEmpty && passwordPredicate.evaluate(with: password){
                if !OTP.isEmpty && OTPPredicate.evaluate(with: OTP){
                    return true
                }else {
                    showAlert(title: "Validation Error", message: "Invalid OTP")
                    return false
                }
            }else {
                showAlert(title: "Validation Error", message: "Password Must Be 8 char Long")
                return false
            }
        }else {
            showAlert(title: "Validation Error", message: "Invalid Email")
            return false
        }
            
    }
}


// MARK: - Extension of SixScreenVC for giving Attributes to TextField

extension SixScreenVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Ensure that only txtOTP textField is considered
        guard textField == txtOTP else {
            return true
        }
        
        // Check if the replacement string contains only numeric characters
        let numericCharacterSet = CharacterSet(charactersIn: "0123456789")
        guard string.rangeOfCharacter(from: numericCharacterSet.inverted) == nil else {
            return false // Reject if replacement string contains non-numeric characters
        }
        
        // Calculate the new string after replacing characters
        let currentText = (textField.text ?? "") as NSString
        let newText = currentText.replacingCharacters(in: range, with: string)
        
        // Check if the length of the new string exceeds the limit
        return newText.count <= 4
    }
}
