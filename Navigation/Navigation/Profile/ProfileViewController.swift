//
//  SecondViewController.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 05.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelfView()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    private func setupSelfView() {
        view.backgroundColor = .white
        view.backgroundColor = .systemGray6
    }
        
//    MARK: - Создание, настройка и размещение таблицы
    
    private lazy var tableView: UITableView = {
        lazy var tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        return tableView
    }()
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//    MARK: - Расширение UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
//    В зависимости от секции возвращает необхобимое количество ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : posts.count
    }
    
//    В зависимости от секции возвращает необходимый тип ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        lazy var cell1 = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
        lazy var cell2 = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        
//      Делегат
        cell2.reciverOfDataFromeCell = self
        
        cell2.pullCell(post: posts[indexPath.row])
        return indexPath.section == 0 ? cell1 : cell2
    }
}


//    MARK: - Расширение UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    
//    Возвращает динамическую высоту ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
//    В зависимости от секции возвращает необходимый хедер
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        lazy var PHView = ProfileHeaderView()
        return section == 0 ? PHView : nil
    }
    
//    В зависимости от секции возвращает необходимую высоту хедера
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? UITableView.automaticDimension : 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        lazy var galleryVC = PhotosViewController()
        galleryVC.title = "Photo Gallery"
        
//      Для делегата
        lazy var cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.pullCell(post: posts[indexPath.row])
        
        indexPath.section == 0 ? navigationController?.pushViewController(galleryVC, animated: true) : showView(descriptionLabel: cell.descriptionLabel)
    }
}



protocol DelegateOfReciverOfDataFromeCell {
    func showView(descriptionLabel: UILabel)
}

extension ProfileViewController: DelegateOfReciverOfDataFromeCell {
    func showView(descriptionLabel: UILabel) {
        
        descriptionLabel.textColor = .white
        
        lazy var viewForDataFromeCell: UIView = {
            lazy var viewForDataFromeCell = UIView()
            viewForDataFromeCell.backgroundColor = .black
            viewForDataFromeCell.alpha = 0.8
            viewForDataFromeCell.translatesAutoresizingMaskIntoConstraints = false
            return viewForDataFromeCell
        }()
        
        self.view.addSubview(viewForDataFromeCell)
        viewForDataFromeCell.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            viewForDataFromeCell.topAnchor.constraint(equalTo: self.view.topAnchor),
            viewForDataFromeCell.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            viewForDataFromeCell.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            viewForDataFromeCell.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: viewForDataFromeCell.centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: viewForDataFromeCell.centerYAnchor)
        ])
        lazy var tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        viewForDataFromeCell.addGestureRecognizer(tap)
    }
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }
}
