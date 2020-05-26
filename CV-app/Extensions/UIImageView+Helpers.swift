//
//  UIImageView+Helpers.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import UIKit

extension UIImageView {
    public func imageFromURL(urlString: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            guard let `data` = data, error == nil else {
                //TODO placeholder for example
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                
                let image = UIImage(data: data)
                self.image = image
            })
            
        }).resume()
    }
}
