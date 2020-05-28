//
//  BaseController.swift
//  CV-app
//
//  Created by Norbert on 28/05/2020.
//

import UIKit

protocol Identifier {
    var uniqueId: String { get set }
}

class BaseController<T: BaseViewModel, S: UIView>: UIViewController, Identifier {
    
    var viewModel: T!
    var contentView: S!
    var uniqueId: String
    
    init() {
        uniqueId = UUID().uuidString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {

        let baseView = BaseViewFactory.shared.create()
        view = baseView
        contentView = viewToLoad()
        baseView.append(contentView)
    }
    
    func viewToLoad() -> S {
        fatalError("must be implemented in child")
    }
    
}
