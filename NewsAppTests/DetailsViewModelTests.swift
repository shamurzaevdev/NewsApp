//
//  DetailsViewModelTests.swift
//  NewsAppTests
//
//  Created by Эл on 13.04.2023.
//

import XCTest
@testable import NewsApp

class MockRouter: RouterProtocol {
        func initialController() {}
        func pushDetailsViewContoller(model: NewsData) {}
    }

class DetailsViewModelTests: XCTestCase {
    
    func testDetailsData() {
        let newsData = NewsData(title: "Foo",
                                description: "Bar",
                                urlToImage: "Baz",
                                url: "https://example.com/article")
            
        let detailsViewModel = DetailsViewModel(newsData: newsData)
            
        let detailsData = detailsViewModel.detailsData
            
        XCTAssertEqual(detailsData.title, "Foo", "Title should match provided news data")
        XCTAssertEqual(detailsData.description, "Bar", "Description should match provided news data")
        XCTAssertEqual(detailsData.imageURL, "Baz", "Image URL should match provided news data")
        XCTAssertEqual(detailsData.articleURL, "https://example.com/article", "Article URL should match provided news data")
    }
}

