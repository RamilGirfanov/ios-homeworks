//
//  CustomCollectionViewCell.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 04.05.2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
//    MARK: - Настройка
    
    private func setupCell() {
        contentView.addSubview(image)
        contentView.layer.cornerRadius = 6
        contentView.clipsToBounds = true
        backgroundColor = .orange
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
