//
//  DetailsViewController.swift
//  NewsApp
//
//  Created by Эл on 06.04.2023.
//

import UIKit

/// A view controller that displays the details of a news article.
final class DetailsViewController: UIViewController {
    
    // MARK: - Private Properties
    private let detailsView = DetailsView()
    private let viewModel: DetailsViewModelProtocol
    
    // MARK: - Initialization
    init(viewModel: DetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        view = detailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        detailsView.readMoreButton.addTarget(self, action: #selector(readMoreTapped), for: .touchUpInside)
    }
    
    // MARK: - Configure UI
    private func configureUI() {
        let viewData = viewModel.detailsData
        detailsView.titleLabel.text = viewData.title
        detailsView.descriptionLabel.text = viewData.description
        if let imageURLString = viewData.imageURL, let url = URL(string: imageURLString) {
            detailsView.imageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    // MARK: - Actions
    @objc private func readMoreTapped() {
        guard let urlString = viewModel.detailsData.articleURL, let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
}
