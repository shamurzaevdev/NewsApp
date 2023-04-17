//
//  Builder.swift
//  NewsApp
//
//  Created by Эл on 13.04.2023.
//

import Foundation
import UIKit

/// A class that implements the `BuilderProtocol` for creating view controllers.
class Builder: BuilderProtocol {
    func makeNewsViewController(router: RouterProtocol) -> UIViewController {
        let view = NewsViewController()
        let newsService = NewsService()
        let viewModel = NewsViewModel(newsService: newsService, router: router)
        view.viewModel = viewModel
        return view
    }
    
    func makeDetailsViewController(router: RouterProtocol, model: NewsData) -> UIViewController {
        let viewModel = DetailsViewModel(newsData: model)
        let view = DetailsViewController(viewModel: viewModel)
        return view
    }
}
