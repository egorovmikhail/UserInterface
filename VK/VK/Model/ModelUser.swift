//
//  ModelUser.swift
//  VK
//
//  Created by Михаил Егоров on 02.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit


struct Friend {
    let name: String?
    let avatar: UIImage?
    let photo: [UIImage?]
}

var friends = [alya, andrey, dariya, masha, oleg, olga, roma, sasha, sergey, slava, sofya, tolya]


let alya = Friend(name: "Аля", avatar: UIImage(named: "alya") , photo: [UIImage(named: "alya"), UIImage(named: "defaultPhoto")])
let andrey = Friend(name: "Андрей", avatar: UIImage(named: "andrey"), photo: [UIImage(named: "andrey")])
let dariya = Friend(name: "Дарья", avatar: UIImage(named: "dariya"), photo: [UIImage(named: "dariya")])
let masha = Friend(name: "Маша", avatar: UIImage(named: "masha"), photo: [UIImage(named: "masha")])
let oleg = Friend(name: "Олег", avatar: UIImage(named: "oleg"), photo: [UIImage(named: "oleg")])
let olga = Friend(name: "Ольга", avatar: UIImage(named: "olga"), photo: [UIImage(named: "olga")])
let roma = Friend(name: "Рома", avatar: UIImage(named: "roma"), photo: [UIImage(named: "roma")])
let sasha = Friend(name: "Саша", avatar: UIImage(named: "sasha"), photo: [UIImage(named: "sasha")])
let sergey = Friend(name: "Сергей", avatar: UIImage(named: "sergey"), photo: [UIImage(named: "sergey")])
let slava = Friend(name: "Слава", avatar: UIImage(named: "slava"), photo: [UIImage(named: "slava")])
let sofya = Friend(name: "Софья", avatar: UIImage(named: "sofya"), photo: [UIImage(named: "sofya")])
let tolya = Friend(name: "Толя", avatar: UIImage(named: "tolya"), photo: [UIImage(named: "tolya")])


extension Friend: Equatable {
    
}



