//
//  ModelUser.swift
//  VK
//
//  Created by Михаил Егоров on 02.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit


struct User {
    let name: String?
    let avatar: UIImage?
    let photo: [UIImage?]
}

struct Section {
    let title: String
    let items: [User]
}


var user = [
    User(name: "Аля"   , avatar: UIImage(named: "alya"  ), photo: [UIImage(named: "alya"  ), UIImage(named: "defaultPhoto")]),
    User(name: "Андрей", avatar: UIImage(named: "andrey"), photo: [UIImage(named: "andrey"), UIImage(named: "roma"  ) , UIImage(named: "sasha" )]),
    User(name: "Дарья" , avatar: UIImage(named: "dariya"), photo: [UIImage(named: "dariya"), UIImage(named: "sasha" ) , UIImage(named: "sergey")]),
    User(name: "Маша"  , avatar: UIImage(named: "masha" ), photo: [UIImage(named: "masha" ), UIImage(named: "sergey") , UIImage(named: "slava" )]),
    User(name: "Олег"  , avatar: UIImage(named: "oleg"  ), photo: [UIImage(named: "oleg"  ), UIImage(named: "slava" ) , UIImage(named: "sofya" )]),
    User(name: "Ольга" , avatar: UIImage(named: "olga"  ), photo: [UIImage(named: "olga"  ), UIImage(named: "sofya" ) , UIImage(named: "tolya" )]),
    User(name: "Рома"  , avatar: UIImage(named: "roma"  ), photo: [UIImage(named: "roma"  ), UIImage(named: "tolya" )]),
    User(name: "Саша"  , avatar: UIImage(named: "sasha" ), photo: [UIImage(named: "sasha" )]),
    User(name: "Сергей", avatar: UIImage(named: "sergey"), photo: [UIImage(named: "sergey")]),
    User(name: "Слава" , avatar: UIImage(named: "slava" ), photo: [UIImage(named: "slava" )]),
    User(name: "Софья" , avatar: UIImage(named: "sofya" ), photo: [UIImage(named: "sofya" )]),
    User(name: "Толя"  , avatar: UIImage(named: "tolya" ), photo: [UIImage(named: "tolya" )])
]
