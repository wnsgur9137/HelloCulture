//
//  HomeTitleSectionView.swift
//  HelloCulture
//
//  Created by JUNHYEOK LEE on 2023/04/16.
//

import UIKit

final class HomeTitleSectionView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textColor = .label
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        return label
    }()
    
    private let titleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 240.0, height: 280.0)
        layout.minimumLineSpacing = 10.0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 12.0, bottom: 0, right: 12.0)
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = false
        collectionView.decelerationRate = .fast
        return collectionView
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

extension HomeTitleSectionView {
    private func addSubviews() {
        self.addSubview(titleLabel)
        self.addSubview(titleCollectionView)
    }
    
    private func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.0),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12.0),
            
            titleCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12.0),
            titleCollectionView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            titleCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12.0),
            titleCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12.0),
        ])
    }
}
