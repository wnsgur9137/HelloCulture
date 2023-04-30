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
        label.text = "Hello, Culture!"
        label.textColor = .label
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        return label
    }()
    
    lazy var titleImageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 240.0, height: 280.0)
        layout.minimumLineSpacing = 10.0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 12.0, bottom: 0, right: 12.0)
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
        collectionView.isPagingEnabled = false
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let todayCurltureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Today Culture"
        label.textColor = .label
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        return label
    }()
    
    lazy var horizontalImageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let itemSize = UIScreen.main.bounds.width - 32.0
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
        collectionView.layer.cornerRadius = 12.0
        collectionView.backgroundColor = .green
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private let seeMoreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("더 보기", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 32.0, weight: .bold)
        return button
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
            titleImageCollectionView,
            todayCurltureLabel,
            horizontalImageCollectionView,
            seeMoreButton,
        ].forEach { contentView.addSubview($0) }
        scrollView.addSubview(contentView)
        self.addSubview(scrollView)
    }
    
    private func setLayoutConstraints() {
        let contentViewHeight = UIScreen.main.bounds.height + ((UIScreen.main.bounds.width - 32.0) * 10)
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
            contentView.heightAnchor.constraint(equalToConstant: contentViewHeight),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12.0),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12.0),

            titleImageCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
            titleImageCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleImageCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleImageCollectionView.heightAnchor.constraint(equalToConstant: 280.0),

            todayCurltureLabel.topAnchor.constraint(equalTo: titleImageCollectionView.bottomAnchor, constant: 48.0),
            todayCurltureLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            horizontalImageCollectionView.topAnchor.constraint(equalTo: todayCurltureLabel.bottomAnchor, constant: 8.0),
            horizontalImageCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            horizontalImageCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            horizontalImageCollectionView.bottomAnchor.constraint(equalTo: seeMoreButton.bottomAnchor, constant: -32.0),
            
            seeMoreButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32.0),
            seeMoreButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}
