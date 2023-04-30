//
//  HomeSectionView.swift
//  HelloCulture
//
//  Created by JUNHYEOK LEE on 2023/04/15.
//

import UIKit

final class HomeSectionView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Culture!"
        label.textColor = .label
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        return label
    }()
    
    private let seeAllButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("모두 보기", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        button.layer.cornerRadius = 8.0
        button.layer.borderColor = UIColor(ciColor: .gray).cgColor
        button.layer.borderWidth = 1.0
        button.clipsToBounds = true
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 0, height: 0)
        layout.minimumLineSpacing = 10.0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 12.0, bottom: 0, right: 12.0)
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
        collectionView.showsHorizontalScrollIndicator = false
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

extension HomeSectionView {
    func setTextForTitleLabel(text: String) {
        self.titleLabel.text = text
    }
}

// MARK: - Layout
extension HomeSectionView {
    private func addSubviews() {
        self.addSubview(titleLabel)
        self.addSubview(seeAllButton)
        self.addSubview(collectionView)
    }
    
    private func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.0),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12.0),
            
            seeAllButton.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            seeAllButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12.0),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12.0),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12.0),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12.0),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12.0),
        ])
    }
}
