//
//  ViewController.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import UIKit

class ViewController: UIViewController {

    var viewModel: UserViewModel!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.white
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
            
            print(user)
        }
    }

}

