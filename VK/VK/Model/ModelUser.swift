//
//  ModelUser.swift
//  VK
//
//  Created by Михаил Егоров on 02.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit


struct UserStatic {
    let name: String?
    let avatar: UIImage?
    let photo: [UIImage?]
}

struct Section {
    let title: String
    let items: [UserStatic]
}

var userStatic = [
    UserStatic(name: "Аля"   , avatar: UIImage(named: "alya"  ), photo: [UIImage(named: "alya"  ), UIImage(named: "defaultPhoto")]),
    UserStatic(name: "Андрей", avatar: UIImage(named: "andrey"), photo: [UIImage(named: "andrey"), UIImage(named: "roma"  ) , UIImage(named: "sasha" )]),
    UserStatic(name: "Дарья" , avatar: UIImage(named: "dariya"), photo: [UIImage(named: "dariya"), UIImage(named: "sasha" ) , UIImage(named: "sergey")]),
    UserStatic(name: "Маша"  , avatar: UIImage(named: "masha" ), photo: [UIImage(named: "masha" ), UIImage(named: "sergey") , UIImage(named: "slava" )]),
    UserStatic(name: "Олег"  , avatar: UIImage(named: "oleg"  ), photo: [UIImage(named: "oleg"  ), UIImage(named: "slava" ) , UIImage(named: "sofya" )]),
    UserStatic(name: "Ольга" , avatar: UIImage(named: "olga"  ), photo: [UIImage(named: "olga"  ), UIImage(named: "sofya" ) , UIImage(named: "tolya" )]),
    UserStatic(name: "Рома"  , avatar: UIImage(named: "roma"  ), photo: [UIImage(named: "roma"  ), UIImage(named: "tolya" )]),
    UserStatic(name: "Саша"  , avatar: UIImage(named: "sasha" ), photo: [UIImage(named: "sasha" )]),
    UserStatic(name: "Сергей", avatar: UIImage(named: "sergey"), photo: [UIImage(named: "sergey")]),
    UserStatic(name: "Слава" , avatar: UIImage(named: "slava" ), photo: [UIImage(named: "slava" )]),
    UserStatic(name: "Софья" , avatar: UIImage(named: "sofya" ), photo: [UIImage(named: "sofya" )]),
    UserStatic(name: "Толя"  , avatar: UIImage(named: "tolya" ), photo: [UIImage(named: "tolya" )])
]


//
//// MARK: - Friend
//struct Friend: Codable {
//    let response: Response
//}
//
//// MARK: - Response
//struct Response: Codable {
//    let items: [Item]
//}
//
//// MARK: - Item
//struct Item: Codable {
//    let id: Int
//    let firstName, lastName: String
//    let photo50: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case firstName
//        case lastName
//        case photo50
//    }
//}


