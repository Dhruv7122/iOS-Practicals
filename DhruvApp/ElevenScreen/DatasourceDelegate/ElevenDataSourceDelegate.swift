//
//  ElevenDatasourceDelegate.swift
//  DhruvApp
//  purpose : Set up Table View
//  Created by STTL on 18/04/24.
//
//

import UIKit

class ElevenDataSourceDelegate: NSObject {
    
    //DataType Alias
    typealias T = StudentModel
    typealias tbl = UITableView
    typealias del = TblViewDelegate
    
    //Internal Variable
    internal var arrSource: [T]
    internal var tblvw: tbl
    internal var delegate: del
    
    //Variables
    var dictionary = [String: [T]]()
    var isSearched = false
    var searchedArr = [T]()
    
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: del, tbl: tbl ) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTable()
        setUpDictionary()
    }
    
    //For Filerting Data
    func filterData(query: String?){
        searchedArr.removeAll()
        if let query = query{
            searchedArr = arrSource.filter({ student in
                return student.name.lowercased().starts(with: query.lowercased())
            })
        }
        print(searchedArr)
        isSearched = true
        reload(arr: searchedArr)
    }
    
    //Set up Dictionary
    func setUpDictionary(){
        dictionary.removeAll()
        for student in (isSearched ? searchedArr: arrSource){
            let char = String(student.name[student.name.startIndex])
            if dictionary[char] == nil{
                dictionary[char] = [student]
            }else{
                dictionary[char]?.append(student)
            }
        }
    }
    
    //Set Up Table Action
    fileprivate func setupTable(){
        let nib = UINib(nibName: "ElevenTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "ElevenTVC")
        tblvw.dataSource = self
        tblvw.delegate = self
        self.tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
        
    }
    
    //Reload Table Action
    func reload(arr:[T ]){
        setUpDictionary()
        tblvw.reloadData()
        
    }
    
    
}

//MARK:- Extension for TableView Delegate
extension ElevenDataSourceDelegate:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tbl: tblvw, indexPath: indexPath)
    }
   
    //title for section Header
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(dictionary.keys)[section]
    }
}

//MARK:- Extension for TableView DataSource
extension ElevenDataSourceDelegate:UITableViewDataSource
{
    //No. of Section in Table
    func numberOfSections(in tableView: UITableView) -> Int {
        return dictionary.keys.count
    }
    
    //No. of Rows in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(dictionary.values)[section].count
    }
    
    //Set Values of Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvw.dequeueReusableCell(withIdentifier: "ElevenTVC", for: indexPath)as! ElevenTVC
        cell.configCell(data: Array(dictionary.values)[indexPath.section][indexPath.row])
        return cell
    }
}
