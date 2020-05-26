//
//  Response.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import Foundation

enum Response<T> {
    case success(T)
    case failure(ApiError)
}
