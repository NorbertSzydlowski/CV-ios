//
//  DetailsCoordinator.swift
//  CV-app
//
//  Created by Norbert on 28/05/2020.
//

import UIKit

class DetailsCoordinator: Coordinator {
    
    var childCoordinators = [String: Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() -> String {
        let controller = DetailsViewController()
        let viewModel  = DetailsViewModel()
        
        controller.viewModel = viewModel
        
        navigationController.pushViewController(controller, animated: true)
        return controller.uniqueId
    }
}
