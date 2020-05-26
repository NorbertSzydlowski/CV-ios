//
//  SkillsView.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import UIKit


class SkillsView: UIView {
    
    
    func prepare(skils: [String]) {
        
        var lastLabel: UILabel?
        
        skils.enumerated().forEach { (index,  element) in
            let skillLabel = UILabel()
            skillLabel.text = element
            addSubview(skillLabel)

            var skillConstraints = [
                index == 0
                ? skillLabel.topAnchor.constraint(equalTo: topAnchor)
                : lastLabel!.bottomAnchor.constraint(equalTo: skillLabel.topAnchor),
                skillLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
                trailingAnchor.constraint(equalTo: skillLabel.trailingAnchor, constant: 24)
            ]
            
            if (index == skils.count - 1) {
                skillConstraints.append(bottomAnchor.constraint(equalTo: skillLabel.bottomAnchor))
            }
            
            NSLayoutConstraint.activate(skillConstraints)
            lastLabel = skillLabel

        }
        
    }
    
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
