//
//  ApiError.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import Foundation

enum ApiError {
    case failed(String)
    
    var value: String {
        switch self {
        case .failed(let message):
            return message
        default:
            return "TODO"
        }
    }
}
