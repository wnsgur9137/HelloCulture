//
//  SearchViewController.swift
//  HelloCulture
//
//  Created by JUNHYEOK LEE on 2023/04/30.
//

import UIKit

final class SearchViewController: UIViewController {
    
    private let searchView: SearchView = {
        let view = SearchView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setLayoutConsraints()
    }
    
    private func addSubviews() {
        self.view.addSubview(searchView)
    }
    
    private func setLayoutConsraints() {
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            searchView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            searchView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
