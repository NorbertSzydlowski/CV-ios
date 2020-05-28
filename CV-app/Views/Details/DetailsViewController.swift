//
//  DetailsViewController.swift
//  CV-app
//
//  Created by Norbert on 28/05/2020.
//

import UIKit

class DetailsViewController: BaseController<DetailsViewModel, DetailsView> {
    
    override func viewToLoad() -> DetailsView {
        return DetailsView()
    }
    
}
