//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 04.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
//    MARK: - Инициализатор
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
//    MARK: - Создание и настройка объектов
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    MARK: - Коллекция
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        return collectionView
    }()
    
    //    MARK: - Расстановка объектов в ячейке

    private func layout() {
        [label, button, collectionView].forEach { contentView.addSubview($0) }
        
        let constr: CGFloat = 12
                        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: constr),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: constr),
            
            button.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -constr),
            
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: constr),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: constr),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -constr),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -constr),
            collectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

}

//  MARK: - Расширение UICollectionViewDataSource

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGalery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.pullCell(photo: photoGalery[indexPath.row])
        return cell
    }
}

//  MARK: - Расширение UICollectionViewDelegateFlowLayout

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    
//    Ставлю 10 потому что при 8pt крайняя правая ячейка уплывает за границы коллекции, приходится прокручивать, чтоб увидеть её всю. При 10pt все отображается нормально
    
    private var interSpace: CGFloat { return 10 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - interSpace * 3) / 4
        return CGSize(width: width, height: width)
    }
}
