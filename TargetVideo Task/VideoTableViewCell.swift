//
//  VideoTableViewCell.swift
//  TargetVideo Task
//
//  Created by Macbook Air 2017 on 28. 1. 2025..
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    static let identifier = "VideoTableViewCell"
    
    private let thumbnailView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .purple
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(thumbnailView)
        thumbnailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thumbnailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            thumbnailView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            thumbnailView.heightAnchor.constraint(equalToConstant: 150),
            thumbnailView.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            title.topAnchor.constraint(equalTo: thumbnailView.bottomAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(model: YouTubeItem) {
        thumbnailView.image = UIImage(systemName: "person")
        title.text = model.snippet.title
    }
    
    override func prepareForReuse() {
        thumbnailView.image = nil
        title.text = nil
    }
}
