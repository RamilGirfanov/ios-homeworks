//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 11.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    let imageView = UIImageView()
    
    private func setupImageView() {
        superview?.addSubview(imageView)
        
        imageView.image = UIImage(named: "profileImage")
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let leftConstr = imageView.leftAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.leftAnchor, constant: 16)
        let topConstr = imageView.topAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.topAnchor, constant: 16)
        let heighConstr = imageView.heightAnchor.constraint(equalToConstant: 150)
        let widthConstr = imageView.widthAnchor.constraint(equalToConstant: 150)
        NSLayoutConstraint.activate([leftConstr, topConstr, heighConstr, widthConstr])
    }
    
    
    let nameLabel = UILabel()
    
    private func setupNameLabel() {
        superview?.addSubview(nameLabel)
        
        nameLabel.text = "Рамиль Гирфанов"
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        let topConstr = nameLabel.topAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.topAnchor, constant: 27)
        let leftConstr = nameLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16)
        NSLayoutConstraint.activate([topConstr, leftConstr])
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
        let topConstr = statusButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16)
        NSLayoutConstraint.activate([heighConstr, leftConstr, rightConstr, topConstr])
        
        statusButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    @objc private func tap() {
        print(someTextLabel.text ?? "Что-то не сработало")
    }
    
    let someTextLabel = UILabel()
    
    private func setupSomeTextLabel() {
        superview?.addSubview(someTextLabel)
        
        someTextLabel.text = "Waiting for something..."
        someTextLabel.textColor = .gray
        someTextLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        someTextLabel.translatesAutoresizingMaskIntoConstraints = false
        let leftConstr = someTextLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16)
        let bottomConstr = someTextLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34)
        NSLayoutConstraint.activate([leftConstr, bottomConstr])
    }
    
    func setupPHView() {
        setupImageView()
        setupNameLabel()
        setupStatusButton()
        setupSomeTextLabel()
    }
}
