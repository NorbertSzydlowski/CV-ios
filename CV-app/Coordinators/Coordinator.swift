//
//  Coordinator.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [String : Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start() -> String
}
