//
//  User.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import Foundation

struct User: Codable {
    let base: Info
    let contact: Contact
    let education: [Education]
    let experience: [Experience]
    let skills: [String]
}
