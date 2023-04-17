//
//  RouterProtocol.swift
//  NewsApp
//
//  Created by Эл on 15.04.2023.
//

import Foundation

/// A protocol that defines the methods for navigation in the application.
protocol RouterProtocol {
    func initialController()
    func pushDetailsViewContoller(model: NewsData)
}
