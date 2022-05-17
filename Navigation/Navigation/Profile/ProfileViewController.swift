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
        let tableView = UITableView(frame: .zero, style: .grouped)
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
    var userImage: UIImage?
    var userView: UIView = {
        var userView = UIView()
        userView.translatesAutoresizingMaskIntoConstraints = false
        return userView
    }()
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
        let cell1 = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
        let cell2 = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
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
        
//        Опознаватель касания
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.fullscreenImage))
        PHView.avatarImageView.addGestureRecognizer(tap)
        PHView.avatarImageView.isUserInteractionEnabled = true
        userImage = PHView.avatarImageView.image
        userView = PHView.viewForAvatar
        
        return section == 0 ? PHView : nil
    }
    
//    В зависимости от секции возвращает необходимую высоту хедера
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? UITableView.automaticDimension : 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let galleryVC = PhotosViewController()
        galleryVC.title = "Photo Gallery"
        indexPath.section == 0 ? navigationController?.pushViewController(galleryVC, animated: true) : nil
    }
}

// MARK: - Обработка касания на аватар

extension ProfileViewController {

    @objc func fullscreenImage() {
        
        /*
        let header = ProfileHeaderView()
        
        header.avatarImageView.isUserInteractionEnabled = true
        header.viewForAvatar.frame = UIScreen.main.bounds
        header.avatarImageView.centerXAnchor.constraint(equalTo: header.viewForAvatar.centerXAnchor).isActive = true
        header.avatarImageView.centerYAnchor.constraint(equalTo: header.viewForAvatar.centerYAnchor).isActive = true
        header.avatarImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        header.avatarImageView.heightAnchor.constraint(equalTo: header.avatarImageView.widthAnchor).isActive = true
        
        self.view.addSubview(header.viewForAvatar)
        self.view.addSubview(header.avatarImageView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        header.avatarImageView.addGestureRecognizer(tap)
         */
         
        
        //создаем новый UIImageView и UIView
        //userImage это свойство созданное в ProfileViewController. Напрямую передать его в метод не можем понятно почему (@objc)
        let bigAvatarImageView = UIImageView(image: userImage)
        let bigViewForAvatar = userView
        
        //размерчики
        bigViewForAvatar.frame = UIScreen.main.bounds
        bigViewForAvatar.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)

        bigAvatarImageView.frame = UIScreen.main.bounds
        bigAvatarImageView.contentMode = .scaleAspectFit
        
        //отображаем
        bigViewForAvatar.addSubview(bigAvatarImageView)
        self.view.addSubview(bigViewForAvatar)
        
        //Кнопка для закрытия фото
        let button: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "xmark"), for: .normal)
            button.tintColor = .black
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        bigViewForAvatar.addSubview(button)
        button.topAnchor.constraint(equalTo: bigViewForAvatar.topAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: bigViewForAvatar.trailingAnchor, constant: 20).isActive = true
        
        //вот эта штука нужна чтоб новая вью реагировала на нажатия
        bigAvatarImageView.isUserInteractionEnabled = true
        
        // создаем опознаватель жестов для новой вью
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        
        //при нажатии закроется
        bigAvatarImageView.addGestureRecognizer(tap)
        
    }
    
    //закрываем
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }
}
