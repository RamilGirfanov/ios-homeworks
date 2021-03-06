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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Создание объектов
    
    private lazy var avatarImageView: UIImageView = {
        lazy var avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "profileImage")
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = 75
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
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
        return setStatusButton
    }()
    
//    MARK: - Настройка кнопки
    
    @objc private func tap() {
        
//      Проверка на заполненность
        guard statusTextField.text?.isEmpty == false else { return statusTextField.attributedPlaceholder = NSAttributedString(string: "Введите статус", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]) }
        statusLabel.text = statusTextField.text
        statusTextField.text = ""
        statusTextField.attributedPlaceholder = NSAttributedString(string: "Введите статус", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray4])
        print("Статус установлен")
    }
     
    // MARK: - Настройка объектов
    
    private func setupPHView() {
        [avatarImageView, stackView, setStatusButton].forEach { addSubview($0) }
        [fullNameLabel, statusLabel, statusTextField].forEach { stackView.addArrangedSubview($0) }
         
        setStatusButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        
        lazy var constr: CGFloat = 16
        lazy var photoConstr: CGFloat = 150

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            avatarImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: constr),
            avatarImageView.heightAnchor.constraint(equalToConstant: photoConstr),
            avatarImageView.widthAnchor.constraint(equalToConstant: photoConstr),
            
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
}
