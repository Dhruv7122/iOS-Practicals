//
//  ThirteenDatasourceDelegate.swift
//  DhruvApp
//
//  Created by STTL on 22/04/24.
//

import Foundation

import UIKit

class ThirteenDataSourceDelegate: NSObject {
    
    //Alias
    typealias T = TodoModel
    typealias tbl = UITableView
    typealias del = TblViewDelegate
    
    //Internal Variables
    internal var arrSource: [T]
    internal var tblvw: tbl
    internal var delegate: del
    
    //Variables
    var editingTitle: String?
    var deletingIndex = 1
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: del, tbl: tbl) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    //Setup Table VIew
    fileprivate func setupTbl(){
        let nib = UINib(nibName: "ThirteenTVC", bundle: nil)
        do {
            try tblvw.register(nib, forCellReuseIdentifier: "ThirteenTVC")
            tblvw.dataSource = self
            tblvw.delegate = self
            self.tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            tblvw.reloadData()
        } catch {
            print("Error registering table view cell: \(error)")
        }
    }
    
    //Reload table
    func reload(arr:[T ]){
        arrSource = arr
        tblvw.reloadData()
    }
    
    
}

//MARK:- Table View Delegate Extension
extension ThirteenDataSourceDelegate:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tbl: tblvw, indexPath: indexPath)
    }
}

//MARK:- Table View Datasource Extension
extension ThirteenDataSourceDelegate:UITableViewDataSource
{
    //No. of Rows in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    //Value of Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblvw.dequeueReusableCell(withIdentifier: "ThirteenTVC", for: indexPath)as! ThirteenTVC
        cell.txtField.delegate = self
        cell.btnDelete.tag = indexPath.row
        cell.btnAdd.addTarget(self, action: #selector(addAction(_:)), for: .touchUpInside)
        cell.btnDelete.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
        
        cell.configCell(data: arrSource[indexPath.row])
        return cell
    }
}

//MARK:- ThirteenDataSourceDelegate Extension
extension ThirteenDataSourceDelegate{
    
    //Add button Action
    @objc func addAction(_ sender: UIButton){
        guard let title = editingTitle, !title.isEmpty else {
            print("Editing title is empty or nil.")
            return
        }
        
        // Calculate the insertion index for the second-to-last position.
        let insertIndex = arrSource.count == 1 ? 0 : (arrSource.count - 1)
        
        do {
            // Insert the new item into the data source.
            arrSource.insert(TodoModel(title: title, isEditing: false), at: insertIndex)
            editingTitle = ""
            self.reload(arr: arrSource)
        } catch {
            print("Error inserting new item: \(error)")
        }
    }
    
    //Delete Button Action
    @objc func deleteAction(_ sender: UIButton){
        print("inside delete action")
        let button = sender
        let index = button.tag
        
        do {
            arrSource.remove(at: index)
            reload(arr: arrSource)
        } catch {
            print("Error deleting item at index \(index): \(error)")
        }
    }
}

//MARK:- Text Field Delegate Extension
extension ThirteenDataSourceDelegate: UITextFieldDelegate{
    
    //txtField Begin Editing Action
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
    }
    
    //txtField Value Changed Action
    @objc func valueChanged(_ textField: UITextField){
        editingTitle = textField.text
    }
    
}
