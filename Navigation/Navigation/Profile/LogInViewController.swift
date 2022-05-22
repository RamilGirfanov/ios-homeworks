//
//  LogInViewController.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 22.04.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        navigationController?.navigationBar.isHidden = true
        self.setupToHideKeyboardOnTapOnView()
    }

//    MARK: - Создание UI объектов
    
    private lazy var logoImage: UIImageView = {
        lazy var logoImage = UIImageView()
        logoImage.image = UIImage(named: "logo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
    
    private lazy var loginTextField: UITextField = {
        lazy var loginTextField = UITextField()
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
        lazy var passTextField = UITextField()
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
    
    private lazy var stack: UIStackView = {
        lazy var stack = UIStackView()
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
        lazy var button = UIButton()
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
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return button
    }()
    
    @objc private func tap() {
        lazy var profileVC = ProfileViewController()
        /*
//      Проверка на заполненность
        guard loginTextField.text?.isEmpty == false else { return loginTextField.attributedPlaceholder = NSAttributedString(string: "Email or phone", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]) }
        guard passTextField.text?.isEmpty == false else { return passTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]) }

//      Проверка на корректность логина
        guard loginTextField.text == "standartlogin" else {
            lazy var alert = UIAlertController(title: "Неверный логин", message: "Введеный логин не верен", preferredStyle: .alert)
            lazy var okAction = UIAlertAction(title: "Ок", style: .default)
            alert.addAction(okAction)
            return present(alert, animated: true)
        }
        
//      Проверка на кол-во символов
        guard passTextField.text?.count ?? 0 >= 8 else {
            func createAletLabel() {
                lazy var aletLabel: UILabel = {
                    lazy var aletLabel = UILabel()
                    aletLabel.text = "Пароль короче 8 символов"
                    aletLabel.textColor = .red
                    aletLabel.translatesAutoresizingMaskIntoConstraints = false
                    return aletLabel
                }()
                self.view.addSubview(aletLabel)
                NSLayoutConstraint.activate([
                    aletLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16),
                    aletLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
                ])
            }
            return createAletLabel()
        }
        
        //      Проверка на корректность пароля
        guard passTextField.text == "standartpassword" else {
            lazy var alert = UIAlertController(title: "Неверный пароль", message: "Введеный пароль не верен", preferredStyle: .alert)
            lazy var okAction = UIAlertAction(title: "Ок", style: .default)
            alert.addAction(okAction)
            return present(alert, animated: true)
        }
        */
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
//    MARK: - Создание КонтентВью и СкроллВью
    
    private lazy var contentView: UIView = {
        lazy var contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var scrollView: UIScrollView = {
        lazy var scrollView = UIScrollView()
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

//  MARK: - Расширение для клавиатуры что бы она скрывалась по нажанию на return

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

//  MARK: - Расширение для клавиатуры что бы она скрывалась по нажанию на любое место экрана

extension UIViewController {
    func setupToHideKeyboardOnTapOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
