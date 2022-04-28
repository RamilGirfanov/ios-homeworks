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

    private func setupSelfView() {
        view.backgroundColor = .white
    }
    
//    MARK: - Создание и настройка таблицы
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
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

//    MARK: - Расширения UITableView

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return massive.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.fillingCell(post: massive[indexPath.row])
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    
}




//MARK: - Удаленный код

/*
  
     let PHView = ProfileHeaderView()

     private func setupPHView() {
         view.backgroundColor = .white
         view.addSubview(PHView)

         PHView.setupPHView()

         PHView.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
             PHView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
             PHView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
             PHView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
             PHView.heightAnchor.constraint(equalToConstant: 220)
         ])
     }
 
 */
