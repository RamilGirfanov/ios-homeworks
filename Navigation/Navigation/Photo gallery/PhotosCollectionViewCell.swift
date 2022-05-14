//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 07.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    //    MARK: - Инициализатор
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        clipsToBounds = true
    }
    
//    MARK: - Функция наполнения

//    Этот метод будем вызывать из другого класса
    func pullCell(photo: UIImage) {
        image.image = photo
    }
}
