//
//  User.swift
//  VK
//
//  Created by Михаил Егоров on 20.05.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import Foundation

struct User: Decodable {
    var response: UserResponse

}

struct UserResponse: Decodable {
    var items: [UserItem]
    }

struct UserItem: Decodable {
    var id = 0
    var firstName = "", lastName = ""
    var avatar = ""

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "photo_50"
    }
}









