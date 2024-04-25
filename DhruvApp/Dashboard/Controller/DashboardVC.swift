//
//  DashboardVC.swift
//  DhruvApp
//
//  Created by STTL on 23/04/24.
//

import UIKit
import SideMenu

class DashboardVC: UIViewController {

    //Main Action
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //SideMenu Button CLick Action
    @IBAction func btnSideMenuClickAction(_ sender: Any) {
        
        if let menuLeftNavigationController = SideMenuManager.default.leftMenuNavigationController {
            if menuLeftNavigationController.presentingViewController != nil {
                menuLeftNavigationController.dismiss(animated: false) {
                    self.present(menuLeftNavigationController, animated: true, completion: nil)
                }
            } else {
                self.present(menuLeftNavigationController, animated: true, completion: nil)
            }
        }
    }
}
