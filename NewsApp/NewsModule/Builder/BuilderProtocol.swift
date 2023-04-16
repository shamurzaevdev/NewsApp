//
//  File.swift
//  NewsApp
//
//  Created by Эл on 13.04.2023.
//

import Foundation
import UIKit

/// A protocol that defines the methods for creating view controllers.
protocol BuilderProtocol {
    func makeNewsViewController(router: RouterProtocol) -> UIViewController
    func makeDetailsViewController(router: RouterProtocol, model: NewsData) -> UIViewController
}
