//
//  FirstViewController.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 05.04.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeButton()
    }
    
    private func makeButton() {
        lazy var button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = view.center
        button.setTitle("Покажи", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func tap() {
        lazy var postVC = PostViewController()
        postVC.postTitle = postTitle
        postVC.title = postTitle.title
        navigationController?.pushViewController(postVC, animated: true)
    }

    lazy var postTitle = PostTitle(title: "Заголовок")
}
