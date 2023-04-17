//
//  Router.swift
//  NewsApp
//
//  Created by Эл on 13.04.2023.
//

import Foundation
import UIKit

/// A class that implements the `RouterProtocol` for managing navigation in the application.
class Router: RouterProtocol {
    
    // MARK: - Properties
    var navController: UINavigationController?
    var builder: BuilderProtocol
    
    // MARK: - Initialization
    init(navController: UINavigationController, builder: BuilderProtocol) {
        self.navController = navController
        self.builder = builder
    }
    
    // MARK: - RouterProtocol Implementation
    func initialController() {
        if let navController = navController {
            let newsController = builder.makeNewsViewController(router: self)
            navController.viewControllers = [newsController]
        }
    }
    
    func pushDetailsViewContoller(model: NewsData) {
        if let navController = navController {
            let detailsViewController = builder.makeDetailsViewController(router: self, model: model)
            navController.pushViewController(detailsViewController, animated: true)
        }
    }
}
