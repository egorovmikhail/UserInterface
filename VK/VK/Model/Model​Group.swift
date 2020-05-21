//
//  Model​Group.swift
//  VK
//
//  Created by Михаил Егоров on 03.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

import Foundation



//// MARK: - Group
//struct Group: Codable {
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
//    let name: String
//    let photo50: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case photo50
//    }
//}










struct GroupStatic {
    let name: String
    let avatar: UIImage?
}

let brain = GroupStatic(name: "Мозг", avatar: UIImage(named: "brain"))
let catBreeders = GroupStatic(name: "Любители кошек", avatar: UIImage(named: "catBreeders"))
let dogBreeders = GroupStatic(name: "Сабаководы", avatar: UIImage(named: "dogBreeders"))
let healthyLifestyle = GroupStatic(name: "Здоровый образ жизни", avatar: UIImage(named: "healthyLifestyle"))
let myСity = GroupStatic(name: "Мой город", avatar: UIImage(named: "myСity"))
let selfDevelopment = GroupStatic(name: "Саморазвитие", avatar: UIImage(named: "selfDevelopment"))
let geekBrains = GroupStatic(name: "Geek Brains", avatar: UIImage(named: "geekBrains"))

extension GroupStatic: Equatable {

}

