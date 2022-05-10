//
//  LogInViewController.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 22.04.2022.
//

import UIKit

class LogInViewController: UIViewController {

//    MARK: - Создание UI объектов
    
    private let logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "logo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
    
    private lazy var loginTextField: UITextField = {
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
        loginTextField.delegate = self
        return loginTextField
    }()
    
    private lazy var passTextField: UITextField = {
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
        passTextField.delegate = self
        return passTextField
    }()
    
    private let stack: UIStackView = {
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
    
    private lazy var button: UIButton = {
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
        
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
            
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc private func tap() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
//    MARK: - Создание КонтентВью и СкроллВью
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
//    MARK: - Настройка UI объектов
    
    private func layout() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [logoImage, stack, button].forEach { contentView.addSubview($0) }
        [loginTextField, passTextField].forEach { stack.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
        
            stack.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stack.heightAnchor.constraint(equalToConstant: 100),
       
            button.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        navigationController?.navigationBar.isHidden = true
    }
    
//    MARK: - Notification center
    
    private let nc = NotificationCenter.default

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(kbShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbShow(notification: NSNotification) {
        if let kbSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        }
    }
    
    @objc private func kbHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

//  MARK: - Расширение для клавиатуры

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
