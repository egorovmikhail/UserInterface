//
//  User.swift
//  VK
//
//  Created by Михаил Егоров on 20.05.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import Foundation
import RealmSwift

struct Section {
    let title: String
    let items: [UserItem]
}

struct User: Decodable {
    let response: UserResponse

}

struct UserResponse: Decodable {
    let items: [UserItem]
    }

class UserItem: Object, Decodable {
    @objc dynamic var id = 0
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var avatar = ""

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "photo_50"
    }
}
