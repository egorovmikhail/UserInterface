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
        avatar.contentMode = .scaleAspectFit
        addSubview(avatar)
//        Создаём контур и обрезаем катинку
        avatar.layer.borderColor = UIColor.black.cgColor
        avatar.layer.borderWidth = 0.0
        avatar.layer.cornerRadius = avatar.bounds.height / 2
        avatar.layer.masksToBounds = true
//        Добавляем тень вокруг картинки
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = avatar.bounds.height / 2
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 5.0
        layer.shadowOffset = .zero
    }
    
    
    func addImage() {
        avatar.image = image
    }
}
