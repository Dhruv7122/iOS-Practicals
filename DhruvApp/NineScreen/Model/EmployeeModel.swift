//
//  EmployeeModel.swift
//  TableView
//
//  Created by STTL on 16/04/24.
//

import Foundation


class EmployeeModel: NSObject {
    
    var name: String!
    var dob: String!
    var department: String!
    
    init(fromDictionary dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        dob = dictionary["dob"] as? String
        department = dictionary["department"] as? String
    }
}

