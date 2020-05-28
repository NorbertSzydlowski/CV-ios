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
    private let experiencesView = ExperiencesView()
    private let nextButton = UIButton()
    
    var clickButton: (() -> ())?
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        nameLabel.textAlignment = .center

        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(skillsView)
        addSubview(experiencesView)
        addSubview(nextButton)
        
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
        ]
        
        NSLayoutConstraint.activate(skillsConstraints)

        let experiencesConstraints = [
            experiencesView.topAnchor.constraint(equalTo: skillsView.bottomAnchor, constant: 48),
            experiencesView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            trailingAnchor.constraint(equalTo: experiencesView.trailingAnchor, constant: 24),
            ]
        
        NSLayoutConstraint.activate(experiencesConstraints)
        
        let buttonConstraints = [
            nextButton.topAnchor.constraint(equalTo: experiencesView.bottomAnchor, constant: 48),
            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            trailingAnchor.constraint(equalTo: nextButton.trailingAnchor, constant: 24),
            bottomAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 24)
        ]
        
        NSLayoutConstraint.activate(buttonConstraints)
        
        setup()
    }
    
    private func setup() {
        nextButton.setTitle("DUMMY BUTTON", for: .normal)
        nextButton.setTitleColor(.red, for: .normal)
        nextButton.addTarget(self, action:#selector(self.buttonTap), for: .touchUpInside)
    }
    
    @objc private func buttonTap() {
        clickButton?()
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
        experiencesView.prepare(experiences: user.experience)
    }
    
}
