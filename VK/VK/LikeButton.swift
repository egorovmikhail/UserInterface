//
//  LikeButton.swift
//  VK
//
//  Created by Михаил Егоров on 18.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

class LikeButton: UIButton {
    
    var liked: Bool = false
    var likeCout = 0
    
    @objc func like() {
        liked.toggle()
        if liked {
            setLike()
        }
        else {
            cancelLike()
        }
        setTitle("\(likeCout)", for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDefault()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDefault()
    }
    
    private func setupDefault() {
        setImage(UIImage(systemName: "heart"), for: .normal)
//        tintColor = .gray
        
        addTarget(self, action: #selector(like), for: .touchUpInside)
    }
    
    func setLike () {
        animateAuthButton​()
        setImage(UIImage(systemName: "heart.fill"), for: .normal)
        tintColor = .red
        setTitleColor(.red, for: .normal)
        likeCout += 1
    }
    
    func cancelLike() {
        animateAuthButton​()
        setImage(UIImage(systemName: "heart"), for: .normal)
        tintColor = .none
        setTitleColor(.gray, for: .normal)
        likeCout -= 1
    }
    
    func animateAuthButton​() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.5
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 1
        animation.beginTime = CACurrentMediaTime()
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        layer.add(animation, forKey: nil)
    }
}
