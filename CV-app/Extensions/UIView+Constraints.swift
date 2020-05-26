//
//  UIView+Constraints.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import UIKit

extension UIView {
    func constraintsEdges(bottomGreater: Bool = false) -> [NSLayoutConstraint] {
        guard let parent = self.superview else { return [] }
        
        return [
            topAnchor.constraint(equalTo: parent.topAnchor),
            leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            bottomGreater
                ? parent.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor)
                : parent.bottomAnchor.constraint(equalTo: bottomAnchor),
            parent.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
    }
}
