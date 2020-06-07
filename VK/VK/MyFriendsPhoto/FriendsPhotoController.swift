//
//  FriendsPhotoController.swift
//  VK
//
//  Created by Михаил Егоров on 01.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class FriendsPhotoController: UIViewController {
    
    @IBOutlet weak var collectionPhotoView: UICollectionView!
    
    var friend: UserItem?
    
    var photo = [PhotoItem]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIReguests().photoGet(idUser: friend!.id){[weak self] photo in
            self?.photo = photo
            self?.collectionPhotoView.reloadData()
            print(photo)
        }
        
        collectionPhotoView.dataSource = self
        
    }
}

extension FriendsPhotoController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsPhotoCell", for: indexPath) as! FriendsPhotoCell
//        cell.photoView.image = friend?.photo[indexPath.row]
        
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        if segue.identifier == "seguePhoto" {
//            if let vcPhoto = segue.destination as? PhotoViewController {
//                vcPhoto.photo = friend?.photo as! [UIImage]
//                
//            }
//        }
//    }
}
