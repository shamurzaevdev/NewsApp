//
//  GoogleSearchData.swift
//  NewsApp
//
//  Created by Эл on 10.04.2023.
//

import Foundation

struct GoogleImageSearchResponse: Decodable {
    let items: [GoogleImageSearchResult]
}

struct GoogleImageSearchResult: Decodable {
    let link: URL?
}
