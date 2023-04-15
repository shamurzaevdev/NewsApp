//
//  Router.swift
//  NewsApp
//
//  Created by Эл on 13.04.2023.
//

import Foundation
import UIKit

protocol RouterProtocol {
    func initialController()
    func pushDetailsViewContoller(model: NewsData)
}

class Router: RouterProtocol {
    var navController: UINavigationController?
    var builder: BuilderProtocol
    
    init(navController: UINavigationController, builder: BuilderProtocol) {
        self.navController = navController
        self.builder = builder
    }
    
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
