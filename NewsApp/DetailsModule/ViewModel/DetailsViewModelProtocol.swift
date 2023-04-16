//
//  DetailsViewModelProtocol.swift
//  NewsApp
//
//  Created by Эл on 13.04.2023.
//

import Foundation

/// A protocol that defines the requirements for a view model that provides data for the details view.
protocol DetailsViewModelProtocol {
    var detailsData: DetailsData { get }
}
