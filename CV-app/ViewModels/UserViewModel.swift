//
//  UserViewModel.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import Foundation

class UserViewModel {
    
    let api: API
    
    init(api: API) {
        self.api = api
    }
    
    public func fetchUser(completion: @escaping (User?, String?) -> ()) {
        api.call(.user, responseType: User.self) { (response) in
            switch (response) {
            case .success(let value):
                DispatchQueue.main.async {
                    completion(value, nil)
                }
                break
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(nil, error.value)
                }
                break
            }
        }
    }
}
