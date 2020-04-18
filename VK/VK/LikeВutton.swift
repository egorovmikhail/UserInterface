//
//  LikeВutton.swift
//  VK
//
//  Created by Михаил Егоров on 18.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

class Like_utton: UIButton {
    
    var liked: Bool = false
    var LikeCout = 0
    
    @objc func like() {
        liked.toggle()
        if liked {
            setLike()
        }
        else {
            cancelLike()
        }
        setTitle("\(LikeCout)", for: .normal)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
