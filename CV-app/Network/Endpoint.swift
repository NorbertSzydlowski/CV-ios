//
//  Endpoint.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import Foundation

enum Endpoint: String {
    
    private static let location = "/NorbertSzydlowski/CV-ios/master/"
    
    case user
    
    var endpoint: String {
        switch self {
        case .user:
            return "\(Endpoint.location)data.json"
        }
    }
}
