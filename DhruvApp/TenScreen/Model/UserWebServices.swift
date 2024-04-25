//
//  UserWebServices.swift
//  DhruvApp
//
//  Created by STTL on 18/04/24.
//

import Foundation
class UserWebServices: NSObject {
    
    //Get userList in Dictionary Datatype
    func getUserList(block : ([UserModel]) -> Swift.Void){
        var responsemodel =  [UserModel]()
        let dict = readJsonFile(ofName: "userList")
        if let arr = dict["UserList"] as? [[String : Any]]{
            responsemodel =  arr.map({ UserModel(fromDictionary: $0)})
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
