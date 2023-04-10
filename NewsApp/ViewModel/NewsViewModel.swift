//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Эл on 08.04.2023.
//

import Foundation
import SwiftSoup


protocol NewsViewModelProtocol: AnyObject {
    var onDataUpdate: (() -> Void)? { get set }
    var newsItems: [NewsData] { get }
    func numberOfItems() -> Int
    func fetchNews()
    func item(at index: Int) -> NewsData
}

final class NewsViewModel: NewsViewModelProtocol {
    
    private let newsService: NewsService
    private(set) var newsItems: [NewsData] = []
    
    var onDataUpdate: (() -> Void)?
    
    init(newsService: NewsService) {
        self.newsService = newsService
    }

    func fetchNews() {
        self.newsService.fetchTopHeadlines { [weak self] newsItems in
            guard let self = self else { return }
            let dispatchGroup = DispatchGroup()
            for var news in newsItems {
                dispatchGroup.enter()
                self.newsService.shortDescription(for: news, maxLength: 100) { shortDescription in
                    news.shortDescription = shortDescription
                    self.newsItems.append(news)
                    dispatchGroup.leave()
                }
            }
            dispatchGroup.notify(queue: .main) {
                self.onDataUpdate?()
            }
        }
    }
    
    func numberOfItems() -> Int {
        return newsItems.count
    }
    
    func item(at index: Int) -> NewsData {
        var news = newsItems[index]
        newsService.shortDescription(for: news, maxLength: 100) { [weak self] shortDescription in
            news.shortDescription = shortDescription
            self?.onDataUpdate?()
        }
        return news
    }
    
    
}
