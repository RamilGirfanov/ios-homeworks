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

    private lazy var feedVC = FeedViewController()
    private lazy var profileVC = LogInViewController()
    private lazy var testVC = TestViewController()

    private func setupController() {
        let firstNC = UINavigationController(rootViewController: feedVC)
        let secondNC = UINavigationController(rootViewController: profileVC)
        let thirdNC = UINavigationController(rootViewController: testVC)
        firstNC.tabBarItem.title = "Лента"
        firstNC.tabBarItem.image = UIImage(systemName: "newspaper")
        secondNC.tabBarItem.title = "Профиль"
        secondNC.tabBarItem.image = UIImage(systemName: "person")
        profileVC.navigationItem.title = "Profile"
        
        thirdNC.tabBarItem.title = "Тест"
        thirdNC.tabBarItem.image = UIImage(systemName: "gamecontroller")

        viewControllers = [firstNC, secondNC, thirdNC]
    }
}
