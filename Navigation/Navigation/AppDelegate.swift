//
//  AppDelegate.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 05.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

//    Это окно на котором будем показывать
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//      Присваиваем размер окна
        window = UIWindow(frame: UIScreen.main.bounds)
//        Присваиваем стартовый экран
        window?.rootViewController = MainTabBarControllerViewController()
        window?.makeKeyAndVisible()
        
        return true
    }


}

