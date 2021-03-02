//
//  PhotoView.swift
//  VK
//
//  Created by Михаил Егоров on 09.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

@IBDesignable class PhotoView: UIView {
 
    let photoView = UIImageView()
//    let likeButton = LikeButton()
    
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

        photoView.contentMode = .scaleToFill
        addSubview(photoView)
        photoView.layer.borderColor = UIColor.black.cgColor
        photoView.layer.borderWidth = 0.5
//        likeButton.frame = CGRect(x: 10, y: 10, width: 40, height: 40)
//        addSubview(likeButton)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoView.frame = bounds
    }
        
    func addImage() {
        photoView.image = image
    }
}
