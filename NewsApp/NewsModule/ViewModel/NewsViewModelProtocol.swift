//
//  NewsViewModelProtocol.swift
//  NewsApp
//
//  Created by Эл on 15.04.2023.
//

import Foundation

/// A protocol that defines the requirements for a view model responsible for managing the news data and interacting with the news service.
protocol NewsViewModelProtocol: AnyObject {
    var onDataUpdate: (() -> Void)? { get set }
    var newsItems: [NewsData] { get }
    var router: RouterProtocol { get set }
    func numberOfItems() -> Int
    func fetchNews()
    func item(at index: Int) -> NewsData
    func pushToDetailsViewControoler(indexPath: Int)
}
