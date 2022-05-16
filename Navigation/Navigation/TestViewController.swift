//
//  TestViewController.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 15.05.2022.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupPHView()
        setupGesters()
    }
    
    // MARK: - Создание объектов
    
    lazy var avatarImageView: UIImageView = {
        lazy var avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "profileImage")
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = 75
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.isUserInteractionEnabled = true
        return avatarImageView
    }()
    
//    Для ДЗ по анимациям нужно создать дополнительный view на котором расположить аватар
    lazy var viewForAvatar: UIView = {
        lazy var view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 75
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()

    // MARK: - Настройка объектов
        
        private var centerXView = NSLayoutConstraint()
        private var centerYView = NSLayoutConstraint()
        private var heightView = NSLayoutConstraint()
        private var widthView = NSLayoutConstraint()
    
        private var centerXAvatarImageView = NSLayoutConstraint()
        private var centerYAvatarImageView = NSLayoutConstraint()
        private var heightAvatarImageView = NSLayoutConstraint()
        private var widthAvatarImageView = NSLayoutConstraint()
    
        private var topAvatarImageView = NSLayoutConstraint()
        private var leadingAvatarImageView = NSLayoutConstraint()
        private var bottomAvatarImageView = NSLayoutConstraint()
        private var trailingAvatarImageView = NSLayoutConstraint()
    
    private func setupPHView() {
        [viewForAvatar].forEach { view.addSubview($0) }
        
        lazy var constr: CGFloat = 16
        lazy var photoConstr: CGFloat = 150
        
        centerXView = viewForAvatar.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        centerYView = viewForAvatar.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        heightView = viewForAvatar.heightAnchor.constraint(equalToConstant: photoConstr)
        widthView = viewForAvatar.widthAnchor.constraint(equalToConstant: photoConstr)

        NSLayoutConstraint.activate([
            centerXView,
            centerYView,
            heightView,
            widthView
            
//            avatarImageView.topAnchor.constraint(equalTo: viewForAvatar.topAnchor),
//            avatarImageView.leftAnchor.constraint(equalTo: viewForAvatar.leftAnchor),
//            avatarImageView.trailingAnchor.constraint(equalTo: viewForAvatar.trailingAnchor),
//            avatarImageView.bottomAnchor.constraint(equalTo: viewForAvatar.bottomAnchor),
        ])
    }
    
    //    MARK: - Анимация
        
        func setupGesters() {
            let tapGester = UITapGestureRecognizer(target: self, action: #selector(tapAction))
            avatarImageView.addGestureRecognizer(tapGester)
            viewForAvatar.addGestureRecognizer(tapGester)
        }
        
        @objc private func tapAction() {
            heightView.constant = 300
            widthView.constant = 300
        }
}
