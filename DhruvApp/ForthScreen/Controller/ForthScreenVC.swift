//
//  ForthScreenVC.swift
//  DhruvApp
//
//  Created by STTL on 11/04/24.
//

import UIKit

class ForthScreenVC: UIViewController {

    // Main Action
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // back Btn Click Action
    @IBAction func btnBackClickAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
