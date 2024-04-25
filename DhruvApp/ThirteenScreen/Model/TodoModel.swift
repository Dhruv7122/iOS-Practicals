//
//  TodoModel.swift
//  DhruvApp
//
//  Created by STTL on 22/04/24.
//

import Foundation

class TodoModel: NSObject {
    
    var title: String!
    var isEditing: Bool!

    
    init(title: String, isEditing: Bool) {
        self.title = title
        self.isEditing = isEditing
    }
}
