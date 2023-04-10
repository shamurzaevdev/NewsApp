//
//  NewsData.swift
//  NewsApp
//
//  Created by Эл on 08.04.2023.
//

import Foundation

struct NewsResponse: Decodable {
    let articles: [NewsData]
}

struct NewsData: Decodable {
    let title: String
    let description: String?
    let urlToImage: URL?
    let url: URL?
    var shortDescription: String?
}

struct ShortDescriptionResponse: Decodable {
    let items: [ShortDescriptionItem]
}

struct ShortDescriptionItem: Decodable {
    let description: String
    let url: String
}