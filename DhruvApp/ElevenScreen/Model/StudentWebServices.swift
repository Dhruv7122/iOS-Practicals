//
//  StudentWebServices.swift
//  DhruvApp
//
//  Created by STTL on 18/04/24.
//

import Foundation

class StudentWebServices: NSObject {
    
    //Getting Student List in Dictionary Type
    func getStudentList(block : ([StudentModel]) -> Swift.Void){
        var responsemodel =  [StudentModel]()
        let dict = readJsonFile(ofName: "studentList")
        if let arr = dict["StudentList"] as? [[String : Any]]{
            responsemodel =  arr.map({ StudentModel(fromDictionary: $0)})
        }
        block(responsemodel)
    }
    
    //Read Json File
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
