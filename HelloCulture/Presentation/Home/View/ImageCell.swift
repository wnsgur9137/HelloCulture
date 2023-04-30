//
//  ImageCell.swift
//  HelloCulture
//
//  Created by 이준혁 on 2023/04/04.
//

import UIKit

final class ImageCell: UICollectionViewCell {
    static let identifier = "ImageCell"
    
    private let coverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemCyan
        imageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    private let curtureName: UILabel = {
        let label = UILabel()
        label.text = "curtureName"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let curturePlace: UILabel = {
        let label = UILabel()
        label.text = "curturePlace"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
extension ImageCell {
    func configureImageSize(width: Float, height: Float) {
        NSLayoutConstraint.activate([
            coverImage.widthAnchor.constraint(equalToConstant: CGFloat(width)),
            coverImage.heightAnchor.constraint(equalToConstant: CGFloat(height))
        ])
    }
}

// MARK: - Layout
extension ImageCell {
    private func addSubviews() {
        [
            coverImage,
            curtureName,
            curturePlace,
        ].forEach { self.addSubview($0) }
    }
    
    private func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            coverImage.topAnchor.constraint(equalTo: self.topAnchor),
            coverImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            coverImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            curtureName.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 8.0),
            curtureName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
            curtureName.trailingAnchor.constraint(equalTo: coverImage.centerXAnchor, constant: -8.0),
            
            curturePlace.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 8.0),
            curturePlace.leadingAnchor.constraint(equalTo: coverImage.centerXAnchor, constant: 8.0),
            curturePlace.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0)
        ])
    }
}
