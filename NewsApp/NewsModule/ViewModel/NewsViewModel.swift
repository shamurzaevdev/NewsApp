//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Эл on 08.04.2023.
//

import Foundation

/// A view model responsible for managing the news data and interacting with the news service.
final class NewsViewModel: NewsViewModelProtocol {
    
    // MARK: - Private Properties
    
    private let newsService: NewsServiceProtocol
    
    // MARK: - Properties
    
    var newsItems: [NewsData] = []
    var router: RouterProtocol
    var onDataUpdate: (() -> Void)?
    
    // MARK: - Initialization
    
    init(newsService: NewsServiceProtocol, router: RouterProtocol) {
        self.newsService = newsService
        self.router = router
    }

    // MARK: - Methods
    
    func fetchNews() {
        self.newsService.fetchTopHeadlines { [weak self] newsItems in
            guard let self = self else { return }
            self.newsItems = newsItems
            DispatchQueue.main.async {
                self.onDataUpdate?()
            }
        }
    }
    
    func numberOfItems() -> Int {
        return newsItems.count
    }
    
    func item(at index: Int) -> NewsData {
        return newsItems[index]
    }
    
    func pushToDetailsViewControoler(indexPath: Int) {
        router.pushDetailsViewContoller(model: newsItems[indexPath])
    }
}
