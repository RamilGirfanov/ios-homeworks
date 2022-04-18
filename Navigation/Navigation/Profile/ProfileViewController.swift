//
//  SecondViewController.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 05.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupPHView()
    }
}
