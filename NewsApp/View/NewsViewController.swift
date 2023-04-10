//
//  ViewController.swift
//  NewsApp
//
//  Created by Эл on 05.04.2023.
//

import UIKit
import SDWebImage

/// This is the main News Page where the customers can scroll the news and select the interesting one
final class NewsViewController: UIViewController {
    
//    private var viewModel: NewsViewModelProtocol?
    private let tableView = UITableView()
    private var viewModel: NewsViewModelProtocol? = NewsViewModel(newsService: NewsService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        
        viewModel?.onDataUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel?.fetchNews()
    }
}

    // MARK: UITableViewDelegate

extension NewsViewController: UITableViewDelegate {
    
}

    // MARK: UITableViewDataSource

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else {
            fatalError("Failed to dequeue NewsTableViewCell")
        }
        guard let news = viewModel?.newsItems[indexPath.row] else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath)
                cell.textLabel?.text = "Nothing" 
                return cell
}
        cell.configure(with: news)
        
        let query = news.title
        APICaller.shared.fetchImageURL(forTitle: query) { imageURL in
            guard let imageURL = imageURL, let url = URL(string: imageURL.absoluteString) else {
                return
            }
            DispatchQueue.main.async {
                cell.newsImageView.sd_setImage(with: url, completed: nil)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        350
    }
}
