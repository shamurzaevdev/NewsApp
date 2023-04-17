//
//  DetailsViewModel.swift
//  NewsApp
//
//  Created by Эл on 13.04.2023.
//

import Foundation

/// A view model that provides data for the details view.
final class DetailsViewModel: DetailsViewModelProtocol {
    
    //MARK: - Private properties
    
    private let newsData: NewsData
    
    // MARK: - Properties
    
    var detailsData: DetailsData {
        return DetailsData(
            title: newsData.title ?? "",
            description: newsData.description ?? "",
            imageURL: newsData.urlToImage,
            articleURL: newsData.url
        )
    }
    
    // MARK: - Initialization
    
    init(newsData: NewsData) {
        self.newsData = newsData
    }
}
