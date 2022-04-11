//
//  SecondViewController.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 05.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let PHView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(PHView)
    }
    
    override func viewWillLayoutSubviews() {
        PHView.frame = view.frame
    }
    
    
}
