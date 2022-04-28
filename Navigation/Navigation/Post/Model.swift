//
//  Model.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 28.04.2022.
//

import UIKit

protocol PostModel {
    var author: String { get }
    var description: String { get }
    var image: String { get }
    var likes: Int { get }
    var views: Int { get }
}
