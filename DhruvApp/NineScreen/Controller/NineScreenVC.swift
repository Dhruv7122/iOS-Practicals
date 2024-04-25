//
//  TableJsonVC.swift
//  TableView
//
//  Created by STTL on 16/04/24.
//

import UIKit

class NineScreenVC: UIViewController {

    //Outlets
    @IBOutlet weak var tblView: UITableView!
    
    //Variables
    var webService = EmployeeWebService()
    var EmployeeDataSourceDelegate : EmployeeDataSourceDelegate!
    var arrData : [EmployeeModel] = []
    
    //Main Action
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    //Function For Getting Data from JSON
    func getData(){
        webService.getEmployeeList { arr in
            arrData = arr
        }
        setupTblView()
    }
    
    //SetUP Table Aciton
    func setupTblView(){
        if EmployeeDataSourceDelegate == nil {
            EmployeeDataSourceDelegate = .init(arrData: arrData, delegate: self, tbl: tblView)
        }
    }

    // back Btn Click Action
    @IBAction func btnBackClickAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- NineScreenVc Extension
extension NineScreenVC : TblViewDelegate {
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        
    }
}

