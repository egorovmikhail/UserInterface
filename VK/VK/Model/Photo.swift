//
//  Photo.swift
//  VK
//
//  Created by Михаил Егоров on 20.05.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let response: PhotoResponse

//    enum CodingKeys: String, CodingKey {
//        case response
//    }
}

struct PhotoResponse: Codable {
    let items: [PhotoItem]

//    enum CodingKeys: String, CodingKey {
//        case items
//    }
}

struct PhotoItem: Codable {
    let id: Int
    let albumid: Int
    let ownerid: Int
    let sizes: [PhotoSize]
    let text: String
    let date: Int
    let likes: PhotoLikes
    let reposts: PhotoReposts

    enum CodingKeys: String, CodingKey {
        case id
        case albumid = "album_id"
        case ownerid = "owner_id"
        case sizes
        case text
        case date
        case likes
        case reposts
    }
}

struct PhotoLikes: Codable {
    let userLikes: Int
    let count: Int

    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}

struct PhotoReposts: Codable {
    let count: Int

    enum CodingKeys: String, CodingKey {
        case count
    }
}

struct PhotoSize: Codable {
    let type: String
    let url: String
    let width: Int
    let height: Int

    enum CodingKeys: String, CodingKey {
        case type
        case url
        case width
        case height
    }
}

