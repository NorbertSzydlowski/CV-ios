//
//  ExperienceView.swift
//  CV-app
//
//  Created by Norbert on 28/05/2020.
//

import UIKit

class ExperiencesView: UIView {
    
    
    func prepare(experiences: [Experience]) {
        
        let header = UILabel()
        header.text = "EXPERIENCE"
        header.font = UIFont.boldSystemFont(ofSize: 17)
        
        addSubview(header)
        
        let headerConstraints = [
            header.topAnchor.constraint(equalTo: topAnchor),
            header.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: 24)
        ]
        
        NSLayoutConstraint.activate(headerConstraints)
        
        var lastLabel: UIView? = header
        
        experiences.enumerated().forEach { (index,  element) in
            let experienceView = ExperienceSingleView()
            experienceView.prepate(experience: element)
            addSubview(experienceView)
            
            var constraints = [
                lastLabel!.bottomAnchor.constraint(equalTo: experienceView.topAnchor, constant: -8),
                experienceView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
                trailingAnchor.constraint(equalTo: experienceView.trailingAnchor, constant: 24)
            ]
            
            if (index == experiences.count - 1) {
                constraints.append(bottomAnchor.constraint(equalTo: experienceView.bottomAnchor))
            }
            
            NSLayoutConstraint.activate(constraints)
            lastLabel = experienceView
            
        }
        
    }
    
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
