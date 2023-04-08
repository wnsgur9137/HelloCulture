//
//  HomeView.swift
//  HelloCulture
//
//  Created by 이준혁 on 2023/04/04.
//

import UIKit

final class HomeView: UIView {
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello! Culture!"
        label.textColor = .label
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        return label
    }()
    
    lazy var mainImageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 240.0, height: 280.0)
        layout.minimumLineSpacing = 10.0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 12.0, bottom: 0, right: 12.0)
        collectionView.backgroundColor = .white
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
        collectionView.backgroundColor = .black
        collectionView.isPagingEnabled = false
        collectionView.decelerationRate = .fast
        return collectionView
    }()
    
    lazy var horizontalImageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
        collectionView.layer.cornerRadius = 12.0
        collectionView.backgroundColor = .green
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
        setLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout
extension HomeView {
    private func addSubviews() {
        [
            titleLabel,
            mainImageCollectionView,
            horizontalImageCollectionView,
        ].forEach { contentView.addSubview($0) }
        scrollView.addSubview(contentView)
        self.addSubview(scrollView)
    }
    
    private func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 1200.0),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12.0),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12.0),

            mainImageCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
            mainImageCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainImageCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainImageCollectionView.heightAnchor.constraint(equalToConstant: 280.0),

            horizontalImageCollectionView.topAnchor.constraint(equalTo: mainImageCollectionView.bottomAnchor, constant: 16.0),
            horizontalImageCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            horizontalImageCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            horizontalImageCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
