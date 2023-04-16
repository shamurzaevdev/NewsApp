//
//  DetailsData.swift
//  NewsApp
//
//  Created by Эл on 13.04.2023.
//

import Foundation

/// A structure that represents the details of a news article.
struct DetailsData: Decodable {
    /// The main title of the article.
    let title: String?
    
    /// A brief description of the article.
    let description: String?
    
    /// The URL to the image associated with the article.
    let imageURL: String?
    
    /// The URL to the full article.
    let articleURL: String?
}
