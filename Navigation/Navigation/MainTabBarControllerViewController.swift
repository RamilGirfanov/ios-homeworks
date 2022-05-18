//
//  MainTabBarControllerViewController.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 05.04.2022.
//

import UIKit

class MainTabBarControllerViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }

    private let feedVC = FeedViewController()
    private let loginVC = LogInViewController()

    private func setupController() {
        let firstNC = UINavigationController(rootViewController: feedVC)
        let secondNC = UINavigationController(rootViewController: loginVC)
        firstNC.tabBarItem.title = "Лента"
        firstNC.tabBarItem.image = UIImage(systemName: "newspaper")
        secondNC.tabBarItem.title = "Профиль"
        secondNC.tabBarItem.image = UIImage(systemName: "person")

        viewControllers = [firstNC, secondNC]
    }
}
