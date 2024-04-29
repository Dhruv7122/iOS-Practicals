//
//  SideMenuVC.swift
//  DhruvApp
//
//  Created by STTL on 23/04/24.
//

import UIKit

class SideMenuVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var tblViewHeight: NSLayoutConstraint!
    @IBOutlet weak var imgLoginUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserEmail: UILabel!
    
    //Variables
    var arrSideMenu : [SideMenuModel] = []
    var sideMenuDataSourceDelegate : SideMenuDataSourceDelegate!
    
    //Main Action
    override func viewDidLoad() {
        super.viewDidLoad()
        // ckeck User Defaults Values
        // set values if available in User Defaults
        if let email = UserDefaults.standard.string(forKey: "UserEmail"){
            lblUserEmail.text = email
            
            // Get substring up to "@" character
            if let atIndex = email.firstIndex(of: "@") {
                let username = email[..<atIndex]
                lblUserName.text = String(username)
            }
        }
        
        // Add observer for content size changes of the table view
        tblView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        
        setUpTableView()
        BorderFactory.addBorder(to: imgLoginUser, cornerRadius: 50, borderColor: UIColor.white, borderWidth: 5.0)
//        tblViewHeight.constant = CGFloat(arrSideMenu.count * 50)
    }
    
    //Read PropertyList Function
    func readPropertyList(ofName: String) -> Any? {
        if let path = Bundle.main.path(forResource: ofName, ofType: "plist") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .init(rawValue: 0))
                let plistData = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
                return plistData
            } catch let error {
                debugPrint(error.localizedDescription)
            }
        }
        return nil
    }
    
    //Set up Table View
    func setUpTableView(){
        if let arr = readPropertyList(ofName: "SideMenuList") as? [[String:Any]] {
            self.arrSideMenu = arr.map({ SideMenuModel(dict: $0) })
        }
        if sideMenuDataSourceDelegate == nil {
            sideMenuDataSourceDelegate = .init(arr: arrSideMenu, tblv: tblView, del: self)
        }
    }
    
    // Observe changes to the contentSize property
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if let newSize = change?[.newKey] as? CGSize {
                // Update the height constraint of the table view
                tblViewHeight.constant = newSize.height
            }
        }
    }
    
    //Logout Button Click Action
    @IBAction func btnLogoutAction(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "UserEmail")
        UserDefaults.standard.removeObject(forKey: "UserPassword")
        UserDefaults.standard.set(false,forKey: "isLoggedIn")
        
        // Navigate to LoginViewController
        let loginVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: loginVC)
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
        // Clear navigation stack
        if let navController = UIApplication.shared.windows.first?.rootViewController as? UINavigationController {
            navController.navigationBar.isHidden = true
            navController.setViewControllers([loginVC], animated: false)
        }
        //Navigation.navigateToOtherController("Login", "LoginVC", from: self)
    }
}

//MARK:- Table View Delegate Extension
extension SideMenuVC : TblViewDelegate {
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        let selectedItem = arrSideMenu[indexPath.row]
        let storyboardName = selectedItem.storyboard
        let vc = selectedItem.vc
        Navigation.navigateToOtherController(storyboardName, vc, from: self)
    }
}
