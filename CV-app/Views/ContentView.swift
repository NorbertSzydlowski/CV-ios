//
//  ContentView.swift
//  CV-app
//
//  Created by Norbert on 26/05/2020.
//

import UIKit

class BaseViewFactory: NSObject {
    static let shared: BaseViewFactory = BaseViewFactory()
    
    func create() -> BaseView {
        let view = BaseView()
        view.backgroundColor = .white
        
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        let constraintsScrollView = scrollView.constraintsEdges()
        NSLayoutConstraint.activate(constraintsScrollView)
        
        let contentView = UIView()
        contentView.backgroundColor = .green
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        
        var constraintsContent = contentView.constraintsEdges()
        constraintsContent.append(contentsOf: [
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            contentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).withPriority(251)
            ])
        
        NSLayoutConstraint.activate(constraintsContent)
        
        return view
    }
}

class BaseView: UIView {
    
    func content() -> UIView {
        return self.subviews.first!.subviews.first!
    }
    
    func append(_ view: UIView) {
        content().subviews.forEach { $0.removeFromSuperview() }
        view.translatesAutoresizingMaskIntoConstraints = false
        content().addSubview(view)
        let constraints = view.constraintsEdges(bottomGreater: true)
        NSLayoutConstraint.activate(constraints)
    }
}
