//
//  AvatarView.swift
//  VK
//
//  Created by Михаил Егоров on 05.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

@IBDesignable class AvatarView: UIView {
    
    let imageView = UIImageView()
    
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
        imageView.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        // Граница вокруг картинки
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 0.0
        
        // Углы
        //imageView.layer.cornerRadius = 30.0
        imageView.layer.cornerRadius = imageView.bounds.height / 2
      
        // Поправим отображения слоя за его границами
        imageView.layer.masksToBounds = true
        
        // Если не установить последнее свойстов, то картинка будет все рвно квадратная, хотя граница нарисуется кргуглой. Т.е. мы установили, что содержимое слоя будет ограничено маской, которая в данном случае является окружностью, созданной закругленными краями.
        //
    }
    
    
    func addImage() {
        imageView.image = image
    }
}
