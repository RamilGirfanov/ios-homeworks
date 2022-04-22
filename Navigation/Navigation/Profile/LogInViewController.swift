//
//  LogInViewController.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 22.04.2022.
//

import UIKit

class LogInViewController: UIViewController {

//    MARK: - Создание UI объектов
    
    let logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "logo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
    
    let loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.textColor = .black
        loginTextField.backgroundColor = .systemGray6
        loginTextField.autocapitalizationType = .none
        loginTextField.placeholder = "Email or phone"
        loginTextField.font = .systemFont(ofSize: 16, weight: .regular)
        loginTextField.tintColor = UIColor(named: "VkBlue")
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.borderStyle = .roundedRect
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.layer.borderWidth = 0.5
        return loginTextField
    }()
    
    let passTextField: UITextField = {
        let passTextField = UITextField()
        passTextField.textColor = .black
        passTextField.backgroundColor = .systemGray6
        passTextField.autocapitalizationType = .none
        passTextField.placeholder = "Password"
        passTextField.font = .systemFont(ofSize: 16, weight: .regular)
        passTextField.tintColor = UIColor(named: "VkBlue")
        passTextField.isSecureTextEntry = true
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        passTextField.borderStyle = .roundedRect
        passTextField.layer.borderColor = UIColor.lightGray.cgColor
        passTextField.layer.borderWidth = 0.5
        return passTextField
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.layer.cornerRadius = 10
        stack.clipsToBounds = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.borderWidth = 0.5
        return stack
    }()
    
    let button: UIButton = {
        let button = UIButton()
        
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        
        switch button.state {
        case .normal:
            button.alpha = 1
        case .selected:
            button.alpha = 0.8
        case .highlighted:
            button.alpha = 0.8
        case .disabled:
            button.alpha = 0.8
        default:
            button.alpha = 1
        }
            
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
//    MARK: - Настройка UI объектов
    
    private func layout() {
        [loginTextField, passTextField].forEach { stack.addArrangedSubview($0) }
        [logoImage, stack, button].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
        
            stack.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stack.heightAnchor.constraint(equalToConstant: 100),
            
            button.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
}
