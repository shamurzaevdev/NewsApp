//
//  NewsData.swift
//  NewsApp
//
//  Created by Эл on 08.04.2023.
//

import Foundation

/// A struct that represents the response from the news API.
struct NewsResponse: Decodable {
    /// An array of news articles.
    let articles: [NewsData]
}

/// A struct that represents the data for a news article.
struct NewsData: Decodable {
    /// The main title of the article
    let title: String?
    
    /// The description of the article.
    let description: String?
    
    /// The URL of the image associated with the article.
    let urlToImage: String?
    
    /// The URL of the article.
    let url: String?
}
