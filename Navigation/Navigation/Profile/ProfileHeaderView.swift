//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 11.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    private func setupImageView() {
        superview?.addSubview(avatarImageView)
        
        NSLayoutConstraint.activate([
            avatarImageView.leftAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.leftAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupNameLabel() {
        superview?.addSubview(fullNameLabel)
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16)
        ])
    }
    
    private func setupSomeTextLabel() {
        superview?.addSubview(statusLabel)
        
        NSLayoutConstraint.activate([
            statusLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16),
            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34)
        ])
    }
    
    
    
    
    let statusButton = UIButton()
    
    private func setupStatusButton() {
        superview?.addSubview(statusButton)
        
        statusButton.setTitle("Show status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.layer.cornerRadius = 4
        statusButton.backgroundColor = .systemBlue
        
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        let heighConstr = statusButton.heightAnchor.constraint(equalToConstant: 50)
        let leftConstr = statusButton.leftAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.leftAnchor, constant: 16)
        let rightConstr = statusButton.rightAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.rightAnchor, constant: -16)
        let topConstr = statusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16)
        NSLayoutConstraint.activate([heighConstr, leftConstr, rightConstr, topConstr])
        
        statusButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    @objc private func tap() {
        print(statusLabel.text ?? "Что-то не сработало")
    }
    

    
    func setupPHView() {
        
        setupImageView()
        setupNameLabel()
        setupStatusButton()
        setupSomeTextLabel()
        
    }
}
