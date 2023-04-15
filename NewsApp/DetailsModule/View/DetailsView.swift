//
//  DetailsView.swift
//  NewsApp
//
//  Created by Эл on 12.04.2023.
//

import UIKit
import SDWebImage

class DetailsView: UIView {
    
    // MARK: - Properties
    let titleLabel = UILabel()
    let imageView = UIImageView()
    let descriptionLabel = UILabel()
    let readMoreButton = UIButton()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        backgroundColor = .white
        
        // Title label
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        addSubview(titleLabel)
        
        // Image view
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        addSubview(imageView)
        
        // Description label
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        addSubview(descriptionLabel)
        
        // Read more button
        readMoreButton.setTitle("Read More", for: .normal)
        readMoreButton.setTitleColor(.white, for: .normal)
        readMoreButton.backgroundColor = .systemBlue
        readMoreButton.layer.cornerRadius = 5
        addSubview(readMoreButton)
        
        // Setup constraints
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        readMoreButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            readMoreButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            readMoreButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            readMoreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            readMoreButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

