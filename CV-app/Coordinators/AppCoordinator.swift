//
//  AppCoordinator.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = ViewController()
        let viewModel  = UserViewModel(api: API.shared)
        
        controller.viewModel = viewModel
        
        navigationController.pushViewController(controller, animated: false)
    }
    
    
}
