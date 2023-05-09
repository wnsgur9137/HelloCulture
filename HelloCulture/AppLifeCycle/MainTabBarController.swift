//
//  MainTabBarController.swift
//  HelloCulture
//
//  Created by 이준혁 on 2023/04/04.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = .white
        self.tabBar.backgroundColor = .black
        setupTabBar()
    }

    private func setupTabBar() {
        let homeTab = UINavigationController(rootViewController: HomeViewController())
        homeTab.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let searchTab = UINavigationController(rootViewController: SearchViewController())
        searchTab.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        
        viewControllers = [
            homeTab,
            searchTab,
        ]
    }
}

