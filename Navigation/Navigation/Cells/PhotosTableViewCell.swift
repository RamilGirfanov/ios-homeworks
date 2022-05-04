//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 04.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
//    MARK: - Создание и настройка объектов
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("arrow.right", for: .normal)
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
            label.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: constr),
            label.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: constr),
            
            button.centerXAnchor.constraint(equalTo: label.centerXAnchor),
            button.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -constr),
            
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: constr),
            collectionView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: constr),
            collectionView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -constr),
            collectionView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -constr)
        ])
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

//  MARK: - Расширение UICollectionViewDataSource

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.pullCell(photo: photoGalery[indexPath.row])
        return cell
    }
}

//  MARK: - Расширение UICollectionViewDelegateFlowLayout

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    
    private var inteSspase: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inteSspase * 3) / 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inteSspase
    }
//    !!!!! 44:58
}
