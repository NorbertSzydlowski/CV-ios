//
//  UIViewController+Helpers.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import UIKit

extension UIViewController {
    func show(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
