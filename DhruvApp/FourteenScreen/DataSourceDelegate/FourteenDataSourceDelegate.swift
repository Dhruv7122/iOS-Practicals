//
//  FourteenDataSourceDelegate.swift
//  DhruvApp
//
//  Created by STTL on 29/04/24.
//

import Foundation
import UIKit

class FourteenDataSourceDelegate: NSObject {
    
    //DataType Alias
    typealias T = EmployeeModel
    typealias tbl = UITableView
    typealias del = TblViewDelegate
    
    //Internal Variable
    internal var arrSource: [T]
    internal var tblvw: tbl
    internal var delegate: del
    
    //Variables
    var arrDetail: [DetailModel] = []
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: del, tbl: tbl ) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTable()
        setUpData()
    }
    
    func setUpData(){
        
        for employee in arrSource {
            // Create DetailModel objects for each property of the EmployeeModel
            let detailName = DetailModel(key: "Name", value: employee.name ?? "")
            let detailDOB = DetailModel(key: "DOB", value: employee.dob ?? "")
            let detailDepartment = DetailModel(key: "Department", value: employee.department ?? "")
            let detailID = DetailModel(key: "Student ID", value: employee.student_id ?? "")
            let detailGender = DetailModel(key: "Gender", value: employee.gender ?? "")
            let detailSports = DetailModel(key: "Sports Name", value: employee.sports_name ?? "")
            let detailAddress = DetailModel(key: "Address", value: employee.address ?? "")
            let detailOneGrade = DetailModel(key: "Sem one grade", value: employee.first_sem_grade ?? "")
            let detailTwoGrade = DetailModel(key: "Sem two grade", value: employee.second_sem_grade ?? "")
            let detailThreeGrade = DetailModel(key: "Sem three grade", value: employee.third_sem_grade ?? "")
            let detailFourGrade = DetailModel(key: "Sem four grade", value: employee.forth_sem_grade ?? "")
            let detailFiveGrade = DetailModel(key: "Sem five grade", value: employee.fifth_sem_grade ?? "")
            let detailSixGrade = DetailModel(key: "Sem six grade", value: employee.sixth_sem_grade ?? "")
            
            // Append the created DetailModel objects to arrDetail
            arrDetail.append(contentsOf: [detailName, detailDOB, detailDepartment, detailID, detailGender, detailSports,detailAddress,detailOneGrade,detailTwoGrade,detailThreeGrade,detailFourGrade,detailFiveGrade,detailSixGrade])
        }
    }
    
    
    //Set Up Table Action
    fileprivate func setupTable(){
        let nib = UINib(nibName: "FourteenTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "FourteenTVC")
        tblvw.dataSource = self
        tblvw.delegate = self
        self.tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
        
    }
    
    //Reload Table Action
    func reload(arr:[T ]){
        tblvw.reloadData()
    }
    
    
}

//MARK:- Extension for TableView Delegate
extension FourteenDataSourceDelegate:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tbl: tblvw, indexPath: indexPath)
    }
}

//MARK:- Extension for TableView DataSource
extension FourteenDataSourceDelegate:UITableViewDataSource
{
    //No. of Rows in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDetail.count
    }
    
    //Set Values of Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvw.dequeueReusableCell(withIdentifier: "FourteenTVC", for: indexPath)as! FourteenTVC
        let rowData = arrDetail[indexPath.row]
        cell.configCell(data: rowData)
        
        //Hide Seperator for last cell
        if arrDetail.count - 1 == indexPath.row {
            cell.viewSeparator.isHidden = true
        }
        
        return cell
    }
}
