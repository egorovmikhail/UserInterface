//
//  FriendsPhotoController.swift
//  VK
//
//  Created by Михаил Егоров on 01.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FriendsPhotoController: UIViewController {
    
    @IBOutlet weak var collectionPhotoView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionPhotoView.dataSource = self

    }
}

extension FriendsPhotoController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsPhotoCell", for: indexPath) as! FriendsPhotoCell
    
        return cell
    }
    
}
