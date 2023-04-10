//
//  HomeViewController.swift
//  HelloCulture
//
//  Created by 이준혁 on 2023/04/04.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let homeHeaderView = HomeHeaderView()
    private let homeView = HomeView()
    
    private var mainImageCollectionView: UICollectionView
    private var horizontalImageCollectionView: UICollectionView
    
    private var viewModel: HomeViewModel
    
    init() {
        self.viewModel = HomeViewModel()
        self.mainImageCollectionView = homeView.mainImageCollectionView
        self.horizontalImageCollectionView = homeView.horizontalImageCollectionView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setLayoutConstraints()
        
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func configureCollectionView() {
        mainImageCollectionView.dataSource = self
        mainImageCollectionView.delegate = self
        
        horizontalImageCollectionView.dataSource = self
        horizontalImageCollectionView.delegate = self
    }
}

// MARK: - CollectionView
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var itemCount = 0
        if collectionView == mainImageCollectionView {
            itemCount = 10
            return itemCount
        } else if collectionView == horizontalImageCollectionView {
            itemCount = 10
            return itemCount
        }
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - ScrollViewDelegate
extension HomeViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let layout = self.mainImageCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        let cellInset = (mainImageCollectionView.frame.width - cellWidthIncludingSpacing) / 2
        let estimatedIndex = scrollView.contentOffset.x / cellWidthIncludingSpacing
        let index: Int
        
        if velocity.x > 0 {
            index = Int(ceil(estimatedIndex))
        } else if velocity.x < 0 {
            index = Int(floor(estimatedIndex))
        } else {
            index = Int(round(estimatedIndex))
        }
        let pointeeX = (CGFloat(index) * cellWidthIncludingSpacing) - cellInset
        targetContentOffset.pointee = CGPoint(x: pointeeX, y: 0)
    }
}

// MARK: - Layout
extension HomeViewController {
    private func addSubviews() {
        [
            homeHeaderView,
            homeView
        ].forEach { self.view.addSubview($0) }
    }
    
    private func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            homeHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            homeHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            homeHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            homeView.topAnchor.constraint(equalTo: homeHeaderView.bottomAnchor),
            homeView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            homeView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}
