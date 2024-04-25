//
//  StudentModel.swift
//  DhruvApp
//
//  Created by STTL on 18/04/24.
//

import Foundation

class StudentModel: NSObject {
    
    var name: String!
    var dob: String!
    var department: String!
    var img: String!
    
    init(fromDictionary dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        dob = dictionary["dob"] as? String
        department = dictionary["department"] as? String
        img = dictionary["img"] as? String
    }
}
