//
//  HomeHeaderView.swift
//  HelloCulture
//
//  Created by 이준혁 on 2023/04/04.
//

import UIKit

final class HomeHeaderView: UIView {
    private let menuButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ISeoulUBlack")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let settingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "gear"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .black
        addSubviews()
        setLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout
extension HomeHeaderView {
    private func addSubviews() {
        [
            menuButton,
            logoImage,
            settingButton,
        ].forEach { self.addSubview($0) }
    }
    
    private func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            menuButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0),
            menuButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
            menuButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8.0),
            menuButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            menuButton.widthAnchor.constraint(equalToConstant: 32.0),
            menuButton.heightAnchor.constraint(equalToConstant: 32.0),
            
            logoImage.topAnchor.constraint(equalTo: menuButton.topAnchor),
            logoImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            logoImage.widthAnchor.constraint(equalToConstant: 32.0),
            logoImage.heightAnchor.constraint(equalToConstant: 32.0),
            
            settingButton.topAnchor.constraint(equalTo: menuButton.topAnchor),
            settingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0),
            settingButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            settingButton.widthAnchor.constraint(equalToConstant: 32.0),
            settingButton.heightAnchor.constraint(equalToConstant: 32.0),
        ])
    }
}
