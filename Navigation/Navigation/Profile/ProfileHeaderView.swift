//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 11.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    //    MARK: - Инициализатор
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPHView()
        setupGesters()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    private lazy var fullNameLabel: UILabel = {
        lazy var fullNameLabel = UILabel()
        fullNameLabel.text = "Рамиль Гирфанов"
        fullNameLabel.textColor = .black
        fullNameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()
    
    private lazy var statusLabel: UILabel = {
        lazy var statusLabel = UILabel()
        statusLabel.text = "Waiting for something..."
        statusLabel.textColor = .gray
        statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    private lazy var statusTextField: UITextField = {
        lazy var statusTextField = UITextField()
        statusTextField.placeholder = "Введите статус"
        statusTextField.textColor = .black
        statusTextField.font = .systemFont(ofSize: 15, weight: .regular)
        statusTextField.borderStyle = .roundedRect
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.backgroundColor = UIColor.white.cgColor
        return statusTextField
    }()
    
    private lazy var stackView: UIStackView = {
        lazy var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var setStatusButton: UIButton = {
        lazy var setStatusButton = UIButton()
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.layer.cornerRadius = 12
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return setStatusButton
    }()
    
//    MARK: - Настройка кнопки
    
    @objc private func tap() {
        statusLabel.text = statusTextField.text
        statusTextField.text = ""
        print("Статус установлен")
    }
     
    // MARK: - Настройка объектов
    
    private var topView = NSLayoutConstraint()
    private var leadingView = NSLayoutConstraint()
    private var heightView = NSLayoutConstraint()
    private var widthView = NSLayoutConstraint()

//    private var centerXAvatarImageView = NSLayoutConstraint()
//    private var centerYAvatarImageView = NSLayoutConstraint()
//    private var heightAvatarImageView = NSLayoutConstraint()
//    private var widthAvatarImageView = NSLayoutConstraint()

//    private var topAvatarImageView = NSLayoutConstraint()
//    private var leadingAvatarImageView = NSLayoutConstraint()
//    private var bottomAvatarImageView = NSLayoutConstraint()
//    private var trailingAvatarImageView = NSLayoutConstraint()
    
    private func setupPHView() {
        [viewForAvatar, avatarImageView, stackView, setStatusButton].forEach { addSubview($0) }
        [fullNameLabel, statusLabel, statusTextField].forEach { stackView.addArrangedSubview($0) }
        
        lazy var constr: CGFloat = 16
        lazy var photoConstr: CGFloat = 150
        
        topView = viewForAvatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        leadingView = viewForAvatar.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: constr)
        heightView = viewForAvatar.heightAnchor.constraint(equalToConstant: photoConstr)
        widthView = viewForAvatar.widthAnchor.constraint(equalToConstant: photoConstr)

        NSLayoutConstraint.activate([
            topView,
            leadingView,
            heightView,
            widthView,
            
            avatarImageView.topAnchor.constraint(equalTo: viewForAvatar.topAnchor),
            avatarImageView.leftAnchor.constraint(equalTo: viewForAvatar.leftAnchor),
            avatarImageView.trailingAnchor.constraint(equalTo: viewForAvatar.trailingAnchor),
            avatarImageView.bottomAnchor.constraint(equalTo: viewForAvatar.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: constr),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -constr),
            stackView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: constr),
            setStatusButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: constr),
            setStatusButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -constr),
            setStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -constr),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

//    MARK: - Анимация
    
    func setupGesters() {
        let tapGester = UITapGestureRecognizer(target: ProfileViewController.self, action: #selector(tapAction))
        avatarImageView.addGestureRecognizer(tapGester)
        viewForAvatar.addGestureRecognizer(tapGester)
    }
    
    @objc private func tapAction() {
        print("Сработало")
//        topView = viewForAvatar.topAnchor.constraint(equalTo: topAnchor)
//        leadingView = viewForAvatar.leftAnchor.constraint(equalTo: leftAnchor)
//        heightView = viewForAvatar.heightAnchor.constraint(equalTo: heightAnchor)
//        widthView = viewForAvatar.widthAnchor.constraint(equalTo: widthAnchor)
            
//            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            avatarImageView.widthAnchor.constraint(equalTo: widthAnchor),
//            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
        heightView.constant = 100
        widthView.constant = 100
        
    }
}
