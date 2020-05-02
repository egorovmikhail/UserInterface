//
//  Model​Group.swift
//  VK
//
//  Created by Михаил Егоров on 03.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

struct Group {
    let name: String
    let avatar: UIImage?
}

let brain = Group(name: "Мозг", avatar: UIImage(named: "brain"))
let catBreeders = Group(name: "Любители кошек", avatar: UIImage(named: "catBreeders"))
let dogBreeders = Group(name: "Сабаководы", avatar: UIImage(named: "dogBreeders"))
let healthyLifestyle = Group(name: "Здоровый образ жизни", avatar: UIImage(named: "healthyLifestyle"))
let myСity = Group(name: "Мой город", avatar: UIImage(named: "myСity"))
let selfDevelopment = Group(name: "Саморазвитие", avatar: UIImage(named: "selfDevelopment"))
let geekBrains = Group(name: "Geek Brains", avatar: UIImage(named: "geekBrains"))

extension Group: Equatable {
    
}
