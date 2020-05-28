//
//  ExperienceSingleView.swift
//  CV-app
//
//  Created by Norbert on 28/05/2020.
//

import UIKit

class ExperienceSingleView: UIView {
    
    private let startLabel   = UILabel()
    private let separator    = UILabel()
    private let finishLabel  = UILabel()
    private let nameLabel    = UILabel()
    

    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
       
        separator.text = "/"
        
        super.init(frame: frame)
        
        addSubview(startLabel)
        addSubview(separator)
        addSubview(finishLabel)
        addSubview(nameLabel)
        
        let startConstraints = [
            startLabel.topAnchor.constraint(equalTo: topAnchor),
            startLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
        ]
        
        NSLayoutConstraint.activate(startConstraints)
        
        
        let separatorConstraints = [
            separator.topAnchor.constraint(equalTo: topAnchor),
            startLabel.trailingAnchor.constraint(equalTo: separator.leadingAnchor, constant: -4),
            ]

        NSLayoutConstraint.activate(separatorConstraints)
        
        let finishConstraints = [
            finishLabel.topAnchor.constraint(equalTo: topAnchor),
            separator.trailingAnchor.constraint(equalTo: finishLabel.leadingAnchor, constant: -4),
        ]
        
        NSLayoutConstraint.activate(finishConstraints)
        
        let nameConstraints = [
            nameLabel.topAnchor.constraint(equalTo: startLabel.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(nameConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func prepate(experience: Experience) {
        startLabel.text = "\(experience.start)"
        finishLabel.text = "\(experience.finish)"
        nameLabel.text = experience.title
    }
    
}
