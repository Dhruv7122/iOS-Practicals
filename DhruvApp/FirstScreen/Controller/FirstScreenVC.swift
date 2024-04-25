//
//  FirstScreenVC.swift
//  secondApp
//
//  Created by STTL on 11/04/24.
//

import UIKit

class FirstScreenVC: UIViewController {

    // Outlets
    @IBOutlet weak var lblHello: UILabel!
    
    // Main Action
    override func viewDidLoad() {
        super.viewDidLoad()

        // lblHello Properties
        lblHello.text = "Hello"
        lblHello.font = UIFont.systemFont(ofSize: 18)
        lblHello.textAlignment = .center
        lblHello.numberOfLines = 0
        lblHello.textColor = UIColor.white
        lblHello.backgroundColor = UIColor.blue
    }
    
    // back Btn Click Action
    @IBAction func btnBackClickAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


