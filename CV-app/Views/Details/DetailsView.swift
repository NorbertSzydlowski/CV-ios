//
//  DetailsView.swift
//  CV-app
//
//  Created by Norbert on 28/05/2020.
//

import UIKit

class DetailsView: UIView {
    
    private let textLabel  = UILabel()
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        textLabel.textAlignment = .center
        textLabel.text = "I prefer XIB files :)"
        textLabel.textColor = .red
        super.init(frame: frame)
        
        addSubview(textLabel)
        
        let textLabelConstraints = [
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            trailingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 24),
            bottomAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 24)
        ]
        
        NSLayoutConstraint.activate(textLabelConstraints)
    }
    
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
