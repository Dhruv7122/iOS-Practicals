//
//  HomeSixVC.swift
//  DhruvApp
//
//  Created by STTL on 11/04/24.
//

import UIKit

class HomeSixVC: UIViewController {

    // Main Action
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //go back to Parent Screen
    @IBAction func btnBackClickAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
