//
//  FirstOfSecondScreenVC.swift
//  secondApp
//
//  Created by STTL on 11/04/24.
//

import UIKit

class FirstOfSecondScreenVC: UIViewController {

    //Outlets
    @IBOutlet weak var viewName: UIView!
    
    // Main Action
    override func viewDidLoad() {
        super.viewDidLoad()

        // viewName properties
        BorderFactory.addBorder(to: viewName, cornerRadius: 25.0, borderColor: nil, borderWidth: 0.0)
        
    }
    
    // Back to Parent Screen
    @IBAction func btnBackClickAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
