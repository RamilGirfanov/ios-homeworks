//
//  Massive.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 28.04.2022.
//

import UIKit

struct Post: PostModel {
    var author: String
    var description: String
    var image: UIImage
    var likes: Int
    var views: Int
}

// MARK: - Создание публикаций и массива из них

var post1 = Post(author: "Рамиль Гирфанов", description: "Ночной город", image: UIImage(named: "IM1")!, likes: 10, views: 29)
var post2 = Post(author: "Рамиль Гирфанов", description: "Зимняя сказка", image: UIImage(named: "IM2")!, likes: 22, views: 40)
var post3 = Post(author: "Рамиль Гирфанов", description: "Памятник геологам Якутии", image: UIImage(named: "IM3")!, likes: 18, views: 34)
var post4 = Post(author: "Рамиль Гирфанов", description: "Над облаками", image: UIImage(named: "IM4")!, likes: 15, views: 36)

var posts = [post1, post2, post3, post4]

