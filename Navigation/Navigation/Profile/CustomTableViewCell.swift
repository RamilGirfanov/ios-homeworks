//
//  TableViewCell.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 28.04.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
//    MARK: - Инициализатор
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
            
//    MARK: - Создание и настройка объектов для кастомизации ячейки
    
    private lazy var view: UIView = {
        lazy var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var authorLabel: UILabel = {
        lazy var authorLabel = UILabel()
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.font = .systemFont(ofSize: 20, weight: .bold)
        authorLabel.textColor = .black
        authorLabel.numberOfLines = 2
        authorLabel.text = "Автор"
        return authorLabel
    }()
    
    private lazy var image: UIImageView = {
        lazy var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        lazy var descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "Описание"
        return descriptionLabel
    }()
    
    private lazy var likesLabel: UILabel = {
        lazy var likesLabel = UILabel()
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.font = .systemFont(ofSize: 16, weight: .regular)
        likesLabel.textColor = .black
        likesLabel.text = "Лайки: 0"
        return likesLabel
    }()
    
    private let viewsLabel: UILabel = {
        lazy var viewsLabel = UILabel()
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.font = .systemFont(ofSize: 16, weight: .regular)
        viewsLabel.textColor = .black
        viewsLabel.text = "Просмотры: 0"
        return viewsLabel
    }()
    
//    MARK: - Обработка нажатий
    
//    Обработка нажатия на лебл с лайками
    
    

//    MARK: - Расстановка объектов в ячейке
    
    private func layout() {
        [view, authorLabel, image, descriptionLabel, likesLabel, viewsLabel].forEach { contentView.addSubview($0) }
        
        lazy var constr: CGFloat = 16
        
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
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            
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
    
//    Этот метод будем вызывать из другого класса
    func pullCell(post: Post) {
        authorLabel.text = post.author
        image.image = post.image
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }
    
//    MARK: - Делегат
    
    var reciverOfDataFromeCell: DelegateOfReciverOfDataFromeCell?
    
}
