//
//  PhotoView.swift
//  VK
//
//  Created by Михаил Егоров on 09.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

@IBDesignable class PhotoView: UIView {
 
    let frendPhotoView = UIImageView()
    
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

        frendPhotoView.contentMode = .scaleToFill
        addSubview(frendPhotoView)
        frendPhotoView.layer.borderColor = UIColor.black.cgColor
        frendPhotoView.layer.borderWidth = 0.5
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        frendPhotoView.frame = bounds
    }
        
    func addImage() {
        frendPhotoView.image = image
    }
}
