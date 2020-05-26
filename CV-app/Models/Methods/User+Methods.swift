//
//  User+Methods.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import Foundation

extension User {
    var fullName: String {
        return "\(base.name) \(base.surname)"
    }
    
    var avatar: String {
        return base.photo
    }
}
