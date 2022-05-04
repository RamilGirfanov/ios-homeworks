//
//  TableViewCell.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 28.04.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
            
//    MARK: - Создание и настройка объектов для кастомизации ячейки
    
    private let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let authorLabel: UILabel = {
        let authorLabel = UILabel()
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.font = .systemFont(ofSize: 20, weight: .bold)
        authorLabel.textColor = .black
        authorLabel.numberOfLines = 2
        authorLabel.text = "Автор"
        return authorLabel
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "Описание"
        return descriptionLabel
    }()
    
    private let likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.font = .systemFont(ofSize: 16, weight: .regular)
        likesLabel.textColor = .black
        likesLabel.text = "Лайки: 0"
        return likesLabel
    }()
    
    private let viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.font = .systemFont(ofSize: 16, weight: .regular)
        viewsLabel.textColor = .black
        viewsLabel.text = "Просмотры: 0"
        return viewsLabel
    }()

//    MARK: - Расстановка объектов в ячейке
    
    func layout() {
        [view, authorLabel, image, descriptionLabel, likesLabel, viewsLabel].forEach { contentView.addSubview($0) }
        
        let constr: CGFloat = 16
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: constr),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constr),
            authorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constr),
            
            image.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 1.0),
            
            descriptionLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: constr),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constr),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constr),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: constr),
            likesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constr),
            likesLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constr),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: constr),
            viewsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constr),
            viewsLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constr)
        ])
    }
    
//    MARK: - Заполнение ячеек данными
    
    func pullCell(post: Post) {
        authorLabel.text = post.author
        image.image = post.image
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }
    
    
//    MARK: - Инициализатор
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
