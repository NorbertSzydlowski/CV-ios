//
//  ViewController.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import UIKit

class ViewController: BaseController<UserViewModel, UserView> {
    
    override func viewToLoad() -> UserView {
        return UserView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        contentView.clickButton = { [weak self] in
            self?.viewModel.next()
        }
        
        viewModel.fetchUser { [weak self] (user, errorMessage) in
            
            guard let `self` = self else { return }
            
            if let error = errorMessage {
                self.show(error: error)
                return
            }
            
            if let `user` = user {
                self.prepare(user: user)
            }
            
        }
    }
    
    private func prepare(user: User) {
        contentView.prepare(user: user)
    }

}

