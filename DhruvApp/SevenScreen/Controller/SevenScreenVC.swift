//
//  SevenScreenVC.swift
//  DhruvApp
//
//  Created by STTL on 11/04/24.
//

import UIKit

class SevenScreenVC: UIViewController {

    // Outlets
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var viewForm: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignInWIthPhone: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var viewScroll: UIScrollView!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnEye: UIButton!
    @IBOutlet weak var btnRememberMe: UIButton!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var imgUnchecked: UIImageView!
    
    //Flags
    var isFirstImage = true
    
    // Main Action
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ckeck User Defaults Values
        // set values if available in User Defaults
        if let email = UserDefaults.standard.string(forKey: "User_Email") , let password = UserDefaults.standard.string(forKey: "User_Password"){
            txtFieldPassword.text = password
            txtFieldEmail.text = email
            btnRememberMe.isSelected = true
        }
        
        // add border to view
        BorderFactory.addBorder(to: viewForm, cornerRadius: 10.0, borderColor: UIColor.darkGray, borderWidth: 0.5)

        BorderFactory.addBorder(to: viewPassword, cornerRadius: 8.0, borderColor: UIColor.darkGray, borderWidth: 0.5)
        BorderFactory.addBorder(to: viewEmail, cornerRadius: 8.0, borderColor: UIColor.darkGray, borderWidth: 0.5)
        
        BorderFactory.addBorder(to: btnSignIn, cornerRadius: 8.0, borderColor: nil, borderWidth: 0.0)
        BorderFactory.addBorder(to: btnSignInWIthPhone, cornerRadius: 8.0, borderColor: nil, borderWidth: 0.0)
        
        // give underline to button
        AttributedString.underlineButton(btnSkip, "SKIP")
        AttributedString.underlineButton(btnForgotPassword, "Forgot Password")
        AttributedString.underlineButton(btnSignUp, "Sign Up")
        AttributedString.underlineButton(btnBack, "BACK")
    
        //Tap Gesture to Password Text Field
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(scrollDown))
                txtFieldPassword.addGestureRecognizer(tapGesture)
        
        // Register for keyboard notifications
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Toggle Password
    @IBAction func togglePasswordOnEyeClick(_ sender: Any) {
        btnEye.isSelected.toggle()
        txtFieldPassword.isSecureTextEntry.toggle()
    }
    
    // Remember Btn Action
    @IBAction func btnRememberClickAction(_ sender: UIButton) {
        sender.isSelected.toggle()
        // Toggle between two images
        if isFirstImage {
            imgUnchecked.image = UIImage(named: "unchecked")
        } else {
            imgUnchecked.image = UIImage(named: "Checkbox")
        }
                
        // Toggle the state
        isFirstImage = !isFirstImage
    }
    
    // Login Btn Click Action
    @IBAction func btnLoginClick(_ sender: Any) {
        
        let email = txtFieldEmail.text
        let password = txtFieldPassword.text
        // check if email and password are not empty
        if isValidEmailAndPassword(email!, password!) {
            
            // check btnRemember State
            // set Email and Password to User Defaults if true
            if btnRememberMe.isSelected {
                UserDefaults.standard.setValue(txtFieldEmail.text, forKey: "User_Email")
                UserDefaults.standard.setValue(txtFieldPassword.text, forKey: "User_Password")
            }else if !btnRememberMe.isSelected{
                UserDefaults.standard.removeObject(forKey: "User_Email")
                UserDefaults.standard.removeObject(forKey: "User_Password")
            }
            
            // navigate to other StoryBoard
            Navigation.navigateToOtherController("HomeSix", "HomeSixVC", from: self)
        }
    }
    
    // back Btn Click Action
    @IBAction func btnBackClickAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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

        //Check Email
        guard !email.isEmpty else {
            showAlert(title: "Validation Error", message: "Please Enter Email")
            return false
        }
        
        //Check Email Format
        guard emailPredicate.evaluate(with: email) else {
            showAlert(title: "Validation Error", message: "Invalid Email")
            return false
        }

        //Check Password is Empty or not
        guard !password.isEmpty else {
            showAlert(title: "Validation Error", message: "Please Enter Password")
            return false
        }

        //Validate Password Format
        guard passwordPredicate.evaluate(with: password) else {
            showAlert(title: "Validation Error", message: "Password Must Be 8 char Long")
            return false
        }

        return true

    }

    //show alert function
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // Unregister for keyboard notifications when view controller is deallocated
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // Scroll Down when Keyboard Open
    @objc func scrollDown() {
        let offset: CGFloat = 100
        viewScroll.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
        txtFieldPassword.becomeFirstResponder()
    }
    
    // Reset scroll view content offset when keyboard is hidden
    @objc func keyboardWillHide() {
        viewScroll.setContentOffset(CGPoint.zero, animated: true)
    }
    
}


