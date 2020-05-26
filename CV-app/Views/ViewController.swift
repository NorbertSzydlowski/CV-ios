//
//  ViewController.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import UIKit

class ViewController: UIViewController {

    var viewModel: UserViewModel!
    private var userView: UserView!
    
    override func loadView() {
        let baseView = BaseViewFactory.shared.create()
        view = baseView
        userView = UserView()
        baseView.append(userView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
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
        userView.prepare(user: user)
    }

}

