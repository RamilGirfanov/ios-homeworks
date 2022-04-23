//
//  MainTabBarControllerViewController.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 05.04.2022.
//

import UIKit

class MainTabBarControllerViewController: UITabBarController {

    let feedVC = FeedViewController()
    let profileVC = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }

    private func setupController() {
        let firstNC = UINavigationController(rootViewController: feedVC)
        let secondNC = UINavigationController(rootViewController: profileVC)
        firstNC.tabBarItem.title = "Лента"
        firstNC.tabBarItem.image = UIImage(systemName: "newspaper")
        secondNC.tabBarItem.title = "Профиль"
        secondNC.tabBarItem.image = UIImage(systemName: "person")
        profileVC.navigationItem.title = "Profile"

        viewControllers = [firstNC, secondNC]
    }
}
