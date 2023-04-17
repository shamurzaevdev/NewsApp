//
//  NewsService.swift
//  NewsApp
//
//  Created by Эл on 09.04.2023.
//

import Foundation

// MARK: - NewsServiceProtocol

/// A protocol that defines the methods to fetch news data.
protocol NewsServiceProtocol {
    func fetchTopHeadlines(completion: @escaping ([NewsData]) -> Void)
}

/// A class that implements the `NewsServiceProtocol` and uses `APICaller` to fetch top headlines.
final class NewsService: NewsServiceProtocol {
    
    // MARK: - NewsServiceProtocol Implementation
    func fetchTopHeadlines(completion: @escaping ([NewsData]) -> Void) {
        APICaller.shared.getTopHeadlines { result in
            switch result {
            case .success(let newsItems):
                completion(newsItems)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
