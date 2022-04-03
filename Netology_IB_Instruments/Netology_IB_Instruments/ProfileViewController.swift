//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Рамиль Гирфанов on 03.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Получаем ширину экрана устройства
        let screenWidth = UIScreen.main.bounds.width
//        Создаем View копию ProfileView
        if let newView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
            newView.frame = CGRect(x: 20,
                                   y: 50,
                                   width: screenWidth - 40,
                                   height: 700)
            view.addSubview(newView)
        }
        
    }
    
}
