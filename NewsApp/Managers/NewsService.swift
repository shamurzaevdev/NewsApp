//
//  NewsService.swift
//  NewsApp
//
//  Created by Эл on 09.04.2023.
//

import Foundation
import SwiftSoup

protocol NewsServiceProtocol {
    func fetchTopHeadlines(completion: @escaping ([NewsData]) -> Void)
}

///
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
    
    func fetchArticleHTML(for url: URL, completion: @escaping (Result<String, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(APIError.failedToGetData))
                return
            }
            guard let html = String(data: data, encoding: .utf8) else {
                completion(.failure(APIError.failedToGetData))
                return
            }
            completion(.success(html))
        }
        task.resume()
    }
    
    func extractArticleText(from html: String) -> String? {
        do {
            let doc: Document = try SwiftSoup.parse(html)
            let elements: Elements = try doc.select("div[itemprop=articleBody]")
            let articleText = try elements.text()
            return articleText
        } catch {
            print("Error parsing HTML: \(error)")
            return nil
        }
    }
    
    func trimArticleText(_ text: String, maxLength: Int) -> String {
        if text.count <= maxLength {
            return text
        }
        let endIndex = text.index(text.startIndex, offsetBy: maxLength)
        let trimmedText = text[text.startIndex..<endIndex]
        let words = trimmedText.components(separatedBy: .whitespacesAndNewlines)
        let shortText = words.dropLast().joined(separator: " ")
        return shortText
    }
    
    func shortDescription(for news: NewsData, maxLength: Int, completion: @escaping (String?) -> Void) {
        guard let urlString = news.url?.absoluteString, let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        fetchArticleHTML(for: url) { result in
            switch result {
            case .success(let html):
                if let articleText = self.extractArticleText(from: html) {
                    let shortDescription = self.trimArticleText(articleText, maxLength: maxLength)
                    completion(shortDescription)
                } else {
                    completion(nil)
                }
            case .failure(_):
                completion(nil)
            }
        }
    }
}
