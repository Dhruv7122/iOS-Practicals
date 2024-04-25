//
//  ViewController.swift
//  DhruvApp
//
//  Created by STTL on 11/04/24.
//

import UIKit

class ViewController: UIViewController {

    // Outlets
    @IBOutlet weak var tblView: UITableView!
    
    //Variables
    var mainDatasourceDelegate : MainDataSourceDelegate!
    var webService = MainWebServices()
    var arrPractical : [MainModel] = []
    
    // Main Action
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()

    }
    
    //Function For Getting Data from JSON
    func getData(){
        webService.getPracticalList { arr in
            arrPractical = arr
        }
        setupTblView()
    }
    
    //SetUP Table Aciton
    func setupTblView(){
        if mainDatasourceDelegate == nil {
            mainDatasourceDelegate = .init(arrData: arrPractical, delegate: self, tbl: tblView)
        }
    }
    
    //Logout Button Click Action
    @IBAction func btnLogoutAction(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "UserEmail")
        UserDefaults.standard.removeObject(forKey: "UserPassword")
        UserDefaults.standard.set(false,forKey: "isLoggedIn")
        Navigation.navigateToOtherController("Login", "LoginVC", from: self)
    }
    
}

//MARK:- ViewController Extension
extension ViewController : TblViewDelegate {
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        let selectedItem = arrPractical[indexPath.row]
        // Check if the selected item has a storyboard name and identifier
        if let storyboardName = selectedItem.storyboard,
           let vc = selectedItem.vc {
            Navigation.navigateToOtherController(storyboardName, vc, from: self)
        }
    }
}
