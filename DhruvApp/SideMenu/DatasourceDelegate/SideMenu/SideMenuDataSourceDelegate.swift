//
//  SideMenuDataSourceDelegate.swift
//  DhruvApp
//
//  Created by STTL on 23/04/24.
//

import Foundation

import UIKit

class SideMenuDataSourceDelegate : NSObject {
    
    //Alias
    typealias tblview = UITableView
    typealias delegate = TblViewDelegate
    
    //Variables
    var arr : [SideMenuModel]
    var tblv  : tblview
    var del : delegate
    fileprivate var selectedSection: IndexPath?
    var tblViewDataSourceDelegate:SideMenuDataSourceDelegate?
 
    //Constructor
    init( arr:[SideMenuModel],tblv : tblview , del : delegate){
        self.arr = arr
        self.tblv = tblv
        self.del = del
        super.init()
        setupTableView()
    }
    
    //Reload Table
    func reload(arr : [SideMenuModel] , selectedSection : IndexPath) {
        self.arr = arr 
        self.selectedSection = selectedSection
        tblv.reloadData()
    }
    
    
    //Set up table
    fileprivate func setupTableView(){
        let nib = UINib(nibName: "SideMenuTVC", bundle: nil)
        tblv.register(nib, forCellReuseIdentifier: "SideMenuTVC")
        tblv.delegate = self
        tblv.dataSource = self
    }
}

//MARK:- Table View Delegate Extension
extension SideMenuDataSourceDelegate : UITableViewDelegate {
    //Did Select function
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        del.didselect(tbl: tblv, indexPath: indexPath)
    }
}

//MARK:- Table View Datasource Extension
extension SideMenuDataSourceDelegate :UITableViewDataSource {
    //No. of rows in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    //Values of Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTVC", for: indexPath) as? SideMenuTVC else {
            print("Error dequeuing reusable cell")
            return UITableViewCell()
        }
        
        let aMenuOptionData = arr[indexPath.row]
        cell.configCell(data: aMenuOptionData)
        
        //Hide Seperator for last cell
        if arr.count - 1 == indexPath.row {
            cell.viewSeperator.isHidden = true
        }
        
        return cell
    }
}
