//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Эл on 08.04.2023.
//

import Foundation

protocol NewsViewModelProtocol: AnyObject {
    var onDataUpdate: (() -> Void)? { get set }
    var newsItems: [NewsData] { get }
    var router: RouterProtocol { get set }
    func numberOfItems() -> Int
    func fetchNews()
    func item(at index: Int) -> NewsData
    func pushToDetailsViewControoler(indexPath: Int)
}

final class NewsViewModel: NewsViewModelProtocol {
    
    private let newsService: NewsService
    private(set) var newsItems: [NewsData] = []
    var router: RouterProtocol
    
    
    var onDataUpdate: (() -> Void)?
    
    init(newsService: NewsService, router: RouterProtocol) {
        self.newsService = newsService
        self.router = router
    }

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
