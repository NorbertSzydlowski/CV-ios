//
//  AppCoordinator.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import UIKit

class AppCoordinator: NSObject, Coordinator {
    
    var childCoordinators = [String : Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        navigationController.delegate = self
    }
    
    func start() -> String {
        let controller = ViewController()
        let viewModel  = UserViewModel(api: API.shared)
        
        viewModel.nextAction = { [weak self] in
            guard let `self` = self else { return }
            let details = DetailsCoordinator(navigationController: self.navigationController)
            self.childCoordinators[details.start()] = details
        }
        
        controller.viewModel = viewModel
        
        navigationController.pushViewController(controller, animated: false)
        return controller.uniqueId
    }
    
    private func free(viewController: UIViewController) {
        guard let controller = viewController as? Identifier else { return }
        childCoordinators.removeValue(forKey: controller.uniqueId)
    }
}

extension AppCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let previousController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(previousController) else {
                return
        }
        
        free(viewController: previousController)
    }
    
}
