//
//  Group.swift
//  VK
//
//  Created by Михаил Егоров on 20.05.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import Foundation

import Foundation

struct Group: Codable {
    let response: GroupResponse
}

struct GroupResponse: Codable {
    let items: [GroupItem]
}

struct GroupItem: Codable {
    let id: Int
    let name: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case avatar = "photo_50"
    }
}
