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
    var student_id: String!
    var gender: String!
    var sports_name:String!
    
    init(fromDictionary dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        dob = dictionary["dob"] as? String
        department = dictionary["department"] as? String
        img = dictionary["img"] as? String
        student_id = dictionary["student_id"] as? String
        gender = dictionary["gender"] as? String
        sports_name = dictionary["sports_name"] as? String
    }
}
