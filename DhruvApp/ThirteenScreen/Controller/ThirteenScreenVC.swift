//
//  ThirteenScreenVC.swift
//  DhruvApp
//
//  Created by STTL on 22/04/24.
//

import UIKit

class ThirteenScreenVC: UIViewController {

    //Outlets
    @IBOutlet weak var tblView: UITableView!
    
    //Variables
    var thirteenDatasourceDelegate: ThirteenDataSourceDelegate!
    
    //Source Data
    var arrSource = [
        TodoModel(title: "", isEditing: true)
    ]
    
    //Main Action
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }
    
    //SetUp Table Action
    func setUpTable(){
        if thirteenDatasourceDelegate == nil {
            thirteenDatasourceDelegate = .init(arrData: arrSource, delegate: self, tbl: tblView)
        }
    }
    
    // back Btn Click Action
    @IBAction func btnBackClickAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- Extension for tblViewDelegate
extension ThirteenScreenVC: TblViewDelegate{
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        
    }
}
