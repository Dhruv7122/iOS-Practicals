//
//  ThirdScreenVC.swift
//  DhruvApp
//
//  Created by STTL on 11/04/24.
//

import UIKit

class ThirdScreenVC: UIViewController {

    //Outlets
    @IBOutlet var viewMain: UIView!
    
    // Main Action
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //Cool,Warm Button Click Action
    @IBAction func btnClick(_ sender: Any) {
        if let button = sender as? UIButton{
            if button.tag == 1{
                viewMain.backgroundColor = UIColor.systemYellow
            }else if button.tag == 0 {
                viewMain.backgroundColor = UIColor.systemBlue
            }
        }
    }

    // back Btn Click Action
    @IBAction func btnBackClickAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


