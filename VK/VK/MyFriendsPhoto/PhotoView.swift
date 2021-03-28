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
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoView.frame = bounds
    }
        
    func addImage() {
        photoView.image = image
    }
}
