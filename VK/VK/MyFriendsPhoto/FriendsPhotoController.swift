//
//  FriendsPhotoController.swift
//  VK
//
//  Created by Михаил Егоров on 01.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

class FriendsPhotoController: UIViewController {
  
  @IBOutlet weak var collectionPhotoView: UICollectionView!
  
  let photoService: PhotoService = {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    return appDelegate?.photoService ?? PhotoService()
  }()
  
  var friend: UserItem?
  
  var photoItem = [PhotoItem]()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    APIReguests().photoGet(idUser: friend!.id){[weak self] photo in
      self?.photoItem = photo
      self?.collectionPhotoView.reloadData()
      dump(photo)
    }
    
    collectionPhotoView.dataSource = self
    
  }
}

extension FriendsPhotoController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return photoItem.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsPhotoCell", for: indexPath) as! FriendsPhotoCell
    
    photoService.getPhoto(urlString: photoItem[indexPath.row].sizes[0].url) { photos in
      let p = photos
      DispatchQueue.main.async {
        cell.photoView.image = p
      }
    }
    //        cell.photoView.image = friend?.photo[indexPath.row]
    
    return cell
  }
  
      override func prepare(for segue: UIStoryboardSegue, sender: Any?){
          if segue.identifier == "seguePhoto" {
              if let vcPhoto = segue.destination as? PhotoViewController {
                vcPhoto.photoItem = photoItem

              }
          }
      }
}
