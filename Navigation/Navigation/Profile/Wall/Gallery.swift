//
//  Photos.swift
//  Navigation
//
//  Created by Рамиль Гирфанов on 04.05.2022.
//

import UIKit

var photoGalery: [UIImage] {
    var photoGalery = [UIImage]()
    for i in 1...20 {
        photoGalery.append(UIImage(named: "G\(i)")!)
    }
    return photoGalery
}
