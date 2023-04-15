//
//  Builder.swift
//  NewsApp
//
//  Created by Эл on 13.04.2023.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    func makeNewsViewController(router: RouterProtocol) -> UIViewController
    func makeDetailsViewController(router: RouterProtocol, model: NewsData) -> UIViewController
}

class Builder: BuilderProtocol {
    func makeNewsViewController(router: RouterProtocol) -> UIViewController {
        let view = NewsViewController()
        let newsService = NewsService()
        let viewModel = NewsViewModel(newsService: newsService, router: router)
        view.viewModel = viewModel
        return view
    }
    
    func makeDetailsViewController(router: RouterProtocol, model: NewsData) -> UIViewController {
        let view = DetailsViewController()
        return view
    }
    
    
}
