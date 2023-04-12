//
//  NewsService.swift
//  NewsApp
//
//  Created by Эл on 09.04.2023.
//

import Foundation

protocol NewsServiceProtocol {
    func fetchTopHeadlines(completion: @escaping ([NewsData]) -> Void)
}

final class NewsService: NewsServiceProtocol {
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
