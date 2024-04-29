//
//  ElevenScreenVC.swift
//  DhruvApp
//
//  Created by STTL on 18/04/24.
//

import UIKit

class ElevenScreenVC: UIViewController {

    //Outlets
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //Variables
    var webService = StudentWebServices()
    var studentDataSourceDelegate : ElevenDataSourceDelegate!
    var arrData : [StudentModel] = []
    
    //Main Action
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        getData()
    }

    //Function For Getting Data from JSON
    func getData(){
        webService.getStudentList { arr in
            arrData = arr
        }
        setupTblView()
    }
    
    //SetUP Table Aciton
    func setupTblView(){
        if studentDataSourceDelegate == nil {
            studentDataSourceDelegate = .init(arrData: arrData, delegate: self, tbl: tblView)
        }
    }

    // back Btn Click Action
    @IBAction func btnBackClickAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- ElevenScreenVC Extension
extension ElevenScreenVC : TblViewDelegate {
    func didselect(tbl: UITableView, indexPath: IndexPath) {
//        let selectedItem = arrData[indexPath.row]
//        Navigation.navigateWithData("FourteenScreen", "FourteenScreenVC", data: selectedItem, from: self)
        //Navigation.navigateToOtherController("FourteenScreen", "FourteenScreenVC", from: self)
    }
}

//MARK:- ElevenScreenVC Extension
extension ElevenScreenVC : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.studentDataSourceDelegate.filterData(query: searchText)
    }
}
