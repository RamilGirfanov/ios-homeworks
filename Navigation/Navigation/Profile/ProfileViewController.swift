//
//  SecondViewController.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 05.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let logInVC: LogInViewController = {
        let logInVC = LogInViewController()
        logInVC.view.backgroundColor = .white
        return logInVC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Пункт 5 ДЗ
        view.addSubview(logInVC.view)
        
//        Пункт 6 ДЗ
        navigationController?.navigationBar.isHidden = true
        
        //setupPHView()
        //setupNewButton()
    }
    
//    MARK: - Настройка LogInViewController
    

    
//    MARK: - Появление и настройка ProfileHeaderView
/*
    let PHView = ProfileHeaderView()

    private func setupPHView() {
        view.addSubview(PHView)

        PHView.setupPHView()

        PHView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            PHView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            PHView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            PHView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            PHView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }

    let newButton: UIButton = {
        let newButton = UIButton()
        newButton.setTitle("I'm new button", for: .normal)
        newButton.backgroundColor = .systemBlue
        newButton.setTitleColor(.white, for: .normal)
        return newButton
    }()

    private func setupNewButton() {
        view.addSubview(newButton)

        newButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
 */

}
