//
//  MovieViewCell.swift
//  VIPER-ARCHITECTURE
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 15/03/25.
//

import UIKit

class MovieViewCell: UITableViewCell {

   let imageViewMovie: UIImageView = {
        let imageView = UIImageView()
       imageView.contentMode = .scaleAspectFit
       imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let averageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews() {
        addSubview(imageViewMovie)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(averageLabel)

        NSLayoutConstraint.activate([
            // Restricciones para imageViewMovie
            imageViewMovie.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageViewMovie.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageViewMovie.heightAnchor.constraint(equalToConstant: 200),
            imageViewMovie.widthAnchor.constraint(equalToConstant: 100),
            imageViewMovie.bottomAnchor.constraint(equalTo: bottomAnchor),

            // Restricciones para titleLabel
            titleLabel.leadingAnchor.constraint(equalTo: imageViewMovie.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            titleLabel.topAnchor.constraint(equalTo: imageViewMovie.topAnchor, constant: 24),

            // Restricciones para descriptionLabel
            descriptionLabel.leadingAnchor.constraint(equalTo: imageViewMovie.trailingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),

            // Restricciones para averageLabel
            averageLabel.leadingAnchor.constraint(equalTo: imageViewMovie.trailingAnchor, constant: 20),
            averageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            averageLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8)
        ])
    }
    
    func configuration(model: PopularMovieEntityLocal) {
        titleLabel.text = model.title
        imageViewMovie.image = UIImage(named: model.poster ?? "")
        descriptionLabel.text = model.overview
        averageLabel.text = "\(model.voteAverage)"
        
    }
    
    
}
