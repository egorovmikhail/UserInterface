//
//  AvatarView.swift
//  VK
//
//  Created by Михаил Егоров on 05.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

class AvatarView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
}
