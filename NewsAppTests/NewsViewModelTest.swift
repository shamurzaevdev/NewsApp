//
//  NewsViewModelTest.swift
//  NewsAppTests
//
//  Created by Эл on 13.04.2023.
//



import XCTest
@testable import NewsApp

class NewsServiceMock: NewsServiceProtocol {
    
    func fetchTopHeadlines(completion: @escaping ([NewsData]) -> Void) {
        completion([NewsData(title: "Baz", description: "Bar", urlToImage: "Foo", url: "https://testurl.com/article")])
    }
}

class RouterMock: RouterProtocol {
    
    func initialController() { }
    func pushDetailsViewContoller(model: NewsData) { }
}

class NewsViewModelTests: XCTestCase {
    
    private var viewModel: NewsViewModel!
    private var newsServiceMock: NewsServiceProtocol!
    private var routerMock: RouterProtocol!

    override func setUp() {
        super.setUp()
        newsServiceMock = NewsServiceMock()
        routerMock = RouterMock()
        viewModel = NewsViewModel(newsService: newsServiceMock, router: routerMock)
    }

    override func tearDown() {
        viewModel = nil
        newsServiceMock = nil
        routerMock = nil
        super.tearDown()
    }

    func testFetchNews() {
        viewModel.fetchNews()
        XCTAssertEqual(viewModel.newsItems.count, 1)
        XCTAssertEqual(viewModel.newsItems[0].title, "Baz")
    }
    
    func testNumberOfItems() {
        viewModel.fetchNews()
        XCTAssertEqual(viewModel.numberOfItems(), 1)
    }
    
    func testItemAtIndex() {
        viewModel.fetchNews()
        let item = viewModel.item(at: 0)
        XCTAssertEqual(item.title, "Baz")
    }

}


