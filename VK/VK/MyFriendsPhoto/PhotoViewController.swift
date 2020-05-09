//
//  PhotoViewController.swift
//  VK
//
//  Created by Михаил Егоров on 04.05.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

enum Direction {
    case none, left, right
}

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var leftPhotoView: PhotoView!
    @IBOutlet weak var currentPhotoView: PhotoView!
    @IBOutlet weak var rightPhotoView: PhotoView!
    
    
    
    var photo = [UIImage]()
    var currentPhotoIndex = 0
    var direction: Direction = .none
    
    let scale09 = CGAffineTransform(scaleX: 0.9, y: 0.9)
    let scale11 = CGAffineTransform(scaleX: 1.1, y: 1.1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPhoto()
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    func setPhoto() {
        var leftPhoto = currentPhotoIndex - 1
        let currentPhoto = currentPhotoIndex
        var rightPhoto = currentPhotoIndex + 1
        
        if leftPhoto < 0 {leftPhoto = photo.count - 1}
        if rightPhoto > photo.count - 1 {rightPhoto = 0}
        
        leftPhotoView.image = photo[leftPhoto]
        currentPhotoView.image = photo[currentPhoto]
        rightPhotoView.image = photo[rightPhoto]
    }
    
    @objc func panGesture(_ recognizer: UIPanGestureRecognizer){
        switch recognizer.state {
            case .began:
                UIView.animate(withDuration: 0.3, animations: {self.currentPhotoView.alpha = 0.6})
            case .changed:
                let translationX = recognizer.translation(in: currentPhotoView).x
                direction = translationX > 0 ? .right : .left
                UIView.animate(withDuration: 0.3, animations: {
                    self.currentPhotoView.transform = CGAffineTransform(translationX: translationX, y: 0)
                        .concatenating(self.scale09)
                    self.rightPhotoView.transform = CGAffineTransform(translationX: translationX, y: 0)
                        .concatenating(self.scale11)
                    self.leftPhotoView.transform = CGAffineTransform(translationX: translationX, y: 0)
                        .concatenating(self.scale11)
                })
            case .ended:
                if direction == .left {
                    currentPhotoIndex += 1
                    if currentPhotoIndex > photo.count - 1 {
                        currentPhotoIndex = 0
                    }
                } else {
                    currentPhotoIndex -= 1
                    if currentPhotoIndex < 0 {
                        currentPhotoIndex = photo.count - 1
                    }
                    
                }
                currentPhotoView.alpha = 1
                
                currentPhotoView.transform = .identity
                leftPhotoView.transform = .identity
                rightPhotoView.transform = .identity
                
                setPhoto()
            default:
                return
        }
        
    }
    
}
