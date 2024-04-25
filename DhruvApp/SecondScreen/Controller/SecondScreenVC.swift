//
//  SecondScreenVC.swift
//  secondApp
//
//  Created by STTL on 11/04/24.
//

import UIKit

class SecondScreenVC: UIViewController {

    // Outlets
    @IBOutlet weak var btnScreen1: UIButton!
    @IBOutlet weak var btnScreen2: UIButton!
    @IBOutlet weak var btnScreen3: UIButton!
    
    // Main Action
    override func viewDidLoad() {
        super.viewDidLoad()

        BorderFactory.addBorder(to: btnScreen1, cornerRadius: 10.0, borderColor: nil, borderWidth: 0.0)
        BorderFactory.addBorder(to: btnScreen2, cornerRadius: 10.0, borderColor: nil, borderWidth: 0.0)
        BorderFactory.addBorder(to: btnScreen3, cornerRadius: 10.0, borderColor: nil, borderWidth: 0.0)
    }
    
    // Screen btn click Action
    @IBAction func btnScreenClickAction(_ sender: Any) {
        let button = sender as! UIButton
        switch button.tag {
        case 0:
            Navigation.navigateToOtherController("FirstOfSecondScreen","FirstOfSecondScreenVC",from : self)
            break
        case 1:
            Navigation.navigateToOtherController("SecondOfSecondScreen","SecondOfSecondScreenVC",from : self)
            break
        case 2:
            Navigation.navigateToOtherController("ThirdOfSecondScreen","ThirdOfSecondScreenVC",from : self)
            break
        default:
            return
        }
    }
    
    // back Btn Click Action
    @IBAction func btnBackClickAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

