//
//  DetailsViewController.swift
//  NewsApp
//
//  Created by Эл on 06.04.2023.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    // MARK: - Properties
    private let detailsView = DetailsView()
    
    var news: NewsData? {
        didSet {
            configureUI()
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailsView
        detailsView.readMoreButton.addTarget(self, action: #selector(readMoreTapped), for: .touchUpInside)
    }
    
    // MARK: - Configure UI
    private func configureUI() {
        detailsView.titleLabel.text = news?.title
                detailsView.descriptionLabel.text = news?.description
                if let imageURLString = news?.urlToImage, let url = URL(string: imageURLString) {
                    detailsView.imageView.sd_setImage(with: url, completed: nil)
                }
    }
    
    // MARK: - Actions
    @objc private func readMoreTapped() {
        guard let urlString = news?.url, let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
}
