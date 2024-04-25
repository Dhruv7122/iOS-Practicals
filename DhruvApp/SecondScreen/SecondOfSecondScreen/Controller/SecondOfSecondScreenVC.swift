//
//  SecondOfSecondScreenVC.swift
//  secondApp
//
//  Created by STTL on 11/04/24.
//

import UIKit

class SecondOfSecondScreenVC: UIViewController {

    // Outlets
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    
    // Main Action
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register btn properties
        BorderFactory.addBorder(to: btnRegister, cornerRadius: 10.0, borderColor: UIColor.white, borderWidth: 2.0)
        
        // login btn properties
        BorderFactory.addBorder(to: btnLogin, cornerRadius: 10.0, borderColor: nil, borderWidth: 0.0)
    }

    // Back to Parent Screen
    @IBAction func btnBackClickAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
