//
//  EmployeeWebService.swift
//  TableView
//
//  Created by STTL on 16/04/24.
//

import Foundation

class EmployeeWebService: NSObject {
    
    //Get employeeList in Dictionary Datatype
    func getEmployeeList(block : ([EmployeeModel]) -> Swift.Void){
        var responsemodel =  [EmployeeModel]()
        let dict = readJsonFile(ofName: "employeeList")
        if let arr = dict["EmployeeList"] as? [[String : Any]]{
            responsemodel =  arr.map({ EmployeeModel(fromDictionary: $0)})
        }
        block(responsemodel)
    }
    
    //Read Data from Json FIle
    func readJsonFile(ofName: String) -> [String : Any] {
        guard let strPath = Bundle.main.path(forResource: ofName, ofType: ".json") else {
            return [:]
        }
        do {
          
            let data = try Data(contentsOf: URL(fileURLWithPath: strPath), options: .alwaysMapped)
            
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let dictJson = jsonResult as? [String : Any] {
                return dictJson
            }
        } catch {
            print("Error!! Unable to parse ")
        }
        return [:]
    }
}
