//
//  NSLayoutConstraint+Priority.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import UIKit

extension NSLayoutConstraint {
    func withPriority(_ value: Float) -> NSLayoutConstraint {
        priority = UILayoutPriority(rawValue: value)
        return self
    }
}


