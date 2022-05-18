//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 07.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        navigationController?.navigationBar.isHidden = false
    }
    
//    MARK: - Создание, настройка и размещение коллекции

    private lazy var collectionView: UICollectionView = {
        lazy var layout = UICollectionViewFlowLayout()
        lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private func layout() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//  MARK: - Расширение UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        lazy var cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.pullCell(photo: photoGalery[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoGalery.count
    }
}

//  MARK: - Расширение UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var interSpace: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        lazy var width = (collectionView.bounds.width - interSpace * 4) / 3
        return CGSize(width: width, height: width)
    }
    
//    Следующие два метода работают только в связке
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: interSpace, left: interSpace, bottom: interSpace, right: interSpace)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return interSpace
    }
}
