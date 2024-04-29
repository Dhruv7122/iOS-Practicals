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
    var student_id: String!
    var gender: String!
    var sports_name:String!
    var address : String!
    var first_sem_grade : String!
    var second_sem_grade : String!
    var third_sem_grade : String!
    var forth_sem_grade : String!
    var fifth_sem_grade : String!
    var sixth_sem_grade : String!
    var img : String!
    
    
    init(fromDictionary dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        dob = dictionary["dob"] as? String
        department = dictionary["department"] as? String
        student_id = dictionary["student_id"] as? String
        gender = dictionary["gender"] as? String
        sports_name = dictionary["sports_name"] as? String
        address = dictionary["address"] as? String
        first_sem_grade = dictionary["first_sem_grade"] as? String
        second_sem_grade = dictionary["second_sem_grade"] as? String
        third_sem_grade = dictionary["third_sem_grade"] as? String
        forth_sem_grade = dictionary["forth_sem_grade"] as? String
        fifth_sem_grade = dictionary["fifth_sem_grade"] as? String
        sixth_sem_grade = dictionary["sixth_sem_grade"] as? String
        img = dictionary["img"] as? String
    }
}

