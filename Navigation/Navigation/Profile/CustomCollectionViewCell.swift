//
//  CustomCollectionViewCell.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 04.05.2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
//    MARK: - Настройка
    
    private func setupCell() {
        addSubview(image)

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        layer.cornerRadius = 6
        clipsToBounds = true
    }
    
//    MARK: - Функция наполнения
    
    func pullCell(photo: UIImage) {
        image.image = photo
    }
    
    //    MARK: - Инициализатор
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
