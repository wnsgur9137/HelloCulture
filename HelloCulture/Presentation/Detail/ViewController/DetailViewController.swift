//
//  DetailViewController.swift
//  HelloCulture
//
//  Created by 이준혁 on 2023/04/10.
//

import UIKit

final class DetailViewController: UIViewController {
//    private let viewModel: DetailViewModel
    
//    init() {
//        self.viewModel = DetailViewModel()
//        super.init()
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - Layout
extension DetailViewController {
    private func addSubviews() {
        [
            detailView,
        ].forEach { self.view.addSubview($0) }
    }
    
    private func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: self.view.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}
