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

extension User: Equatable {
}



