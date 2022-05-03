//
//  PostViewController.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 05.04.2022.
//

import UIKit

// Меняю названия структур и объектов из-за необходимостти корректного нейминга в более поздних ДЗ
struct PostTitle {
    let title: String
}

class PostViewController: UIViewController {
    
    var postTitle: PostTitle?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        makeBarItem()

    }
    
    private func makeBarItem(){
        let barItem = UIBarButtonItem(title: "Инфо", style: .plain, target: self, action: #selector(tap))
        navigationItem.rightBarButtonItem = barItem
    }
    
    @objc private func tap() {
        let infoVC = InfoViewController()
        infoVC.title = "Инфо"
        present(infoVC, animated: true)
    }
    
}
