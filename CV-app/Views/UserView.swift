//
//  UserView.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import UIKit

class UserView: UIView {
    
    private let imageView  = RoundImageView()
    private let nameLabel  = UILabel()
    private let skillsView = SkillsView()
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        nameLabel.textAlignment = .center

        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(skillsView)
        
        let imageViewConstraints = [
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 80)
        ]
        
        NSLayoutConstraint.activate(imageViewConstraints)

        let labelConstraints = [
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 48),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 24)
        ]
        
        NSLayoutConstraint.activate(labelConstraints)
        
        let skillsConstraints = [
            skillsView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 48),
            skillsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            trailingAnchor.constraint(equalTo: skillsView.trailingAnchor, constant: 24),
            bottomAnchor.constraint(equalTo: skillsView.bottomAnchor, constant: 24)
        ]
        
        NSLayoutConstraint.activate(skillsConstraints)

    }
    
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(user: User) {
        nameLabel.text = user.fullName
        imageView.imageFromURL(urlString: user.avatar)
        skillsView.prepare(skils: user.skills)
    }
    
}
