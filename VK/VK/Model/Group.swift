//
//  Group.swift
//  VK
//
//  Created by Михаил Егоров on 20.05.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import Foundation
import RealmSwift

struct Group: Codable {
    let response: GroupResponse
}

struct GroupResponse: Codable {
    let items: [GroupItem]
}

class GroupItem: Object,Codable {
    @objc dynamic var id: Int
    @objc dynamic var name: String
    @objc dynamic var avatar: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case avatar = "photo_50"
    }
}
