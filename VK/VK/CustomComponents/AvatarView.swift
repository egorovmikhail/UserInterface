//
//  AvatarView.swift
//  VK
//
//  Created by Михаил Егоров on 05.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

@IBDesignable class AvatarView: UIView {
    
    let avatar = UIImageView()
    let button = UIButton()
        
@IBInspectable var image: UIImage? {
        didSet {
            addImage()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    func setup () {
//        Создаём фрейм для картинки
        avatar.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.frame = avatar.frame
        avatar.contentMode = .scaleAspectFit
        button.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(animateAuthButton​), for: .touchDown)
        addSubview(avatar)
        addSubview(button)
        
//        Создаём контур и обрезаем катинку
        avatar.layer.borderColor = UIColor.black.cgColor
        avatar.layer.borderWidth = 0.0
        avatar.layer.cornerRadius = avatar.bounds.height / 2
        avatar.layer.masksToBounds = true
//        Добавляем тень вокруг картинки
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = avatar.bounds.height / 2
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
      
//      layer.shadowPath = UIBezierPath(rect: bounds).cgPath
//      layer.shadowColor = UIColor.black.cgColor
//      layer.shadowOpacity = 0.5
//      layer.shadowOffset = .zero
//      layer.shadowRadius = 11
    }
    
    func addImage() {
        avatar.image = image
    }
    
  @objc func animateAuthButton​() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.85
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 0.2
        animation.fillMode = CAMediaTimingFillMode.backwards
        layer.add(animation, forKey: nil)
    }
}
