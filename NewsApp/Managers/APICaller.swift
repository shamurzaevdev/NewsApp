//
//  APICaller.swift
//  NewsApp
//
//  Created by Эл on 06.04.2023.
//

import Foundation
import SwiftSoup

// MARK: Constants

struct Constants {
    static let API_KEY = "a7f1fd22a8774214b38a667bcbaad3bc"
    static let baseURL = "https://newsapi.org/v2/top-headlines"
}

enum APIError: Error {
    case failedToGetData
}

final class APICaller {
    
    static let shared = APICaller()
    private var gotData = [NewsData]()
    
    func getTopHeadlines(completion: @escaping (Result<[NewsData], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/?country=us&apiKey=\(Constants.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(NewsResponse.self, from: data)
                completion(.success(results.articles))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
}
