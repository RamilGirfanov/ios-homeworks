//
//  InfoViewController.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 06.04.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        makeButton()
    }
    
    private func makeButton() {
        lazy var button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = view.center
        button.setTitle("Внимание", for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func tap(){
        lazy var alert = UIAlertController(title: "Предупреждение", message: "Предупреждаю", preferredStyle: .alert)
        lazy var okAction = UIAlertAction(title: "Предупрежден", style: .default) { _ in
            print("Успех")
        }
        lazy var canselAction = UIAlertAction(title: "Отмена", style: .destructive)
        alert.addAction(okAction)
        alert.addAction(canselAction)
        present(alert, animated: true)
    }
}
