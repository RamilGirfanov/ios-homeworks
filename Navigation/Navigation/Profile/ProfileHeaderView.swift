//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 11.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    // MARK: - create UI objects
    
    let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        
        avatarImageView.image = UIImage(named: "profileImage")
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = 75
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return avatarImageView
    }()
    
    let fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        
        fullNameLabel.text = "Рамиль Гирфанов"
        fullNameLabel.textColor = .black
        fullNameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return fullNameLabel
    }()
    
    let statusLabel: UILabel = {
        let statusLabel = UILabel()
        
        statusLabel.text = "Waiting for something..."
        statusLabel.textColor = .gray
        statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return statusLabel
    }()
    
    let statusTextField: UITextField = {
        let statusTextField = UITextField()
        
        statusTextField.placeholder = "Введите статус"
        statusTextField.textColor = .black
        statusTextField.font = .systemFont(ofSize: 15, weight: .regular)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.backgroundColor = UIColor.white.cgColor
        
        return statusTextField
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        
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
     
    // MARK: - setup UI objects
    
    func setupPHView() {
        
        superview?.addSubview(avatarImageView)
        superview?.addSubview(stackView)
        superview?.addSubview(setStatusButton)
        
        stackView.addArrangedSubview(fullNameLabel)
        stackView.addArrangedSubview(statusLabel)
        stackView.addArrangedSubview(statusTextField)
        
        setStatusButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            avatarImageView.leftAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.leftAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.topAnchor, constant: 0),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            
            stackView.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 0),
            
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.leftAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.leftAnchor, constant: 16),
            setStatusButton.rightAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.rightAnchor, constant: -16),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16)
        ])
    }
    
    @objc private func tap() {
        statusLabel.text = statusTextField.text
        statusTextField.text = ""
        print("Статус установлен")
    }
}
