//
//  APICaller.swift
//  NewsApp
//
//  Created by Эл on 06.04.2023.
//

import Foundation

// MARK: Constants

struct Constants {
    static let API_KEY = "a7f1fd22a8774214b38a667bcbaad3bc"
    static let baseURL = "https://newsapi.org/v2/top-headlines"
    static let googleAPI_KEY = "AIzaSyDBp5OyyIyvtuDohawWWN_Yz8VppPjjoiE"
    static let googleSearchId = "b2f696ed6f42f478d"
}

enum APIError: Error {
    case failedToGetData
}

final class APICaller {
    
    static let shared = APICaller()
    
    func getTopHeadlines(completion: @escaping (Result<[NewsData], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/?country=fr&apiKey=\(Constants.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(NewsResponse.self, from: data)
                print("Articles: \(results.articles.count)")
                completion(.success(results.articles))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func fetchImageURL(forTitle title: String, completion: @escaping (URL?) -> Void) {
        let query = title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://www.googleapis.com/customsearch/v1?q=\(query)&cx=\(Constants.googleSearchId)&searchType=image&key=\(Constants.googleAPI_KEY)"

        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()

                do {
                    let response = try decoder.decode(GoogleImageSearchResponse.self, from: data)
                    let imageURL = response.items.first?.link
                    completion(imageURL)
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(nil)
                }
            } else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
            }
        }
        task.resume()
    }
}
