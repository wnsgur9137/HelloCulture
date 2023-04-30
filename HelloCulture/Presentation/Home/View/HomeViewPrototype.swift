//
//  HomeViewPrototype.swift
//  HelloCulture
//
//  Created by JUNHYEOK LEE on 2023/04/16.
//

import UIKit

final class HomeViewPrototype: UIScrollView {
    
    private let roundedBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor =
        view.configureTopCornerRadius(radius: 24.0)
        return view
    }()
    
    private let titleSectionView: HomeTitleSectionView = {
        let view = HomeTitleSectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var sectionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 40.0
        return stackView
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

extension HomeViewPrototype {
    private func addSubviews() {
        self.addSubview(titleSectionView)
        self.addSubview(roundedBackgroundView)
        
        roundedBackgroundView.addSubview(sectionStackView)
    }
    
    private func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            titleSectionView.topAnchor.constraint(equalTo: self.contentLayoutGuide.topAnchor, constant: 12.0),
            titleSectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleSectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            roundedBackgroundView.topAnchor.constraint(equalTo: titleSectionView.bottomAnchor, constant: 20.0),
            roundedBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            roundedBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            roundedBackgroundView.bottomAnchor.constraint(equalTo: self.contentLayoutGuide.bottomAnchor)
        ])
    }
}
