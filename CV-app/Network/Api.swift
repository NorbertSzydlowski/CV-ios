//
//  Api.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import Foundation

final class API: NSObject {
    private let baseURL = "https://github.com/"
    
    static let shared: API = API()
    
    func call<T: Decodable>(_ apiEndpoint: Endpoint, responseType: T.Type, completion: @escaping (Response<T>) -> ()) {
        
        let url = URL(string: baseURL + apiEndpoint.endpoint)!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if let error = error {
                completion(.failure(.failed(error.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.failed("TODO")))
                return
            }
            
            guard let data = data else {
                completion(.failure(.failed("TODO")))
                return
            }
            
            if let convertedData = try? JSONDecoder().decode(responseType, from: data) {
                completion(.success(convertedData))
                return
            }
            
            completion(.failure(.failed("TODO")))
        })
        
        task.resume()
    }
}
