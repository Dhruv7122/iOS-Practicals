//
//  SideMenuModel.swift
//  DhruvApp
//
//  Created by STTL on 23/04/24.
//

import Foundation

class SideMenuModel : NSObject {
    var name:String
    let storyboard:String
    let vc:String
//    let img:String
    var expanded : Bool
    
    enum keys: String {
        case name
        case storyboard
        case vc
//        case img
        case expanded
        
    }
    init(dict : [String:Any]){
        self.name = dict[keys.name.rawValue] as? String ?? ""
        self.storyboard = dict[keys.storyboard.rawValue] as? String ?? ""
        self.vc = dict[keys.vc.rawValue] as? String ?? ""
//        self.img = dict[keys.img.rawValue] as? String ?? ""
        self.expanded = false
    }
}
