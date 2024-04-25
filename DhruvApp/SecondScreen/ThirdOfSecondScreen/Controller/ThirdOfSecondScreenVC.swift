//
//  ThirdOfSecondScreenVC.swift
//  secondApp
//
//  Created by STTL on 11/04/24.
//

import UIKit

class ThirdOfSecondScreenVC: UIViewController {

    // Outlets
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var viewAccount: UIView!
    @IBOutlet weak var viewButton: UIView!
    
    // Main Action
    override func viewDidLoad() {
        super.viewDidLoad()

        // viewMain properties
        BorderFactory.addBorder(to: viewMain, cornerRadius: 0.0, borderColor: UIColor.white, borderWidth: 10.0)
        
        //viewAccount Properties
        BorderFactory.addBorder(to: viewAccount, cornerRadius: 10.0, borderColor: nil, borderWidth: 0.0)
        BorderFactory.addBorder(to: viewButton, cornerRadius: 10.0, borderColor: nil, borderWidth: 0.0)

    }
    
    // Back to Parent Screen
    @IBAction func btnBackClickAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
