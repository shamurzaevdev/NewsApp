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
    var description: String?
    let urlToImage: String?
    let url: String?
}
