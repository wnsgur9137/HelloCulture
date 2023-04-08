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
    
    private func configureCollectionView() {
        mainImageCollectionView.dataSource = self
        mainImageCollectionView.delegate = self
        
        horizontalImageCollectionView.dataSource = self
        mainImageCollectionView.delegate = self
    }
}

// MARK: - CollectionView
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainImageCollectionView {
            print("verticalImageCollectionView: 10")
            return 10
        } else if collectionView == horizontalImageCollectionView {
            print("horizontalImageCollectionView: 5")
            return 30
        }
        return 10
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
        print("collectionView: \(collectionView)\tindex:\(indexPath)")
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
            homeHeaderView.topAnchor.constraint(equalTo: self.view.topAnchor),
            homeHeaderView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            homeHeaderView.heightAnchor.constraint(equalToConstant: 40.0),
            
            homeView.topAnchor.constraint(equalTo: homeHeaderView.bottomAnchor),
            homeView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            homeView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}
