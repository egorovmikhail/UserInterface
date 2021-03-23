//
//  MyFriendsCell.swift
//  VK
//
//  Created by Михаил Егоров on 01.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

class MyFriendsCell: UITableViewCell {
  
  @IBOutlet weak var myFriendsName: UILabel!
  @IBOutlet weak var avatarView: AvatarView!
  
  @IBAction func avatarAnimate(_ sender: Any?) {
    avatarView.animateAuthButton​()
  }
  var friendSection = [Section]()
  
  func configure() {
    let indexPath = IndexPath(row: 0, section: 0)
    
    var name = friendSection[indexPath.section].items[indexPath.row].firstName
    name += friendSection[indexPath.section].items [indexPath.row].lastName
    myFriendsName.text = name
    
    if let url = URL(string: String(friendSection[indexPath.section].items[indexPath.row].avatar)) {
      DispatchQueue.global().async {
        let data = try? Data(contentsOf: url)
        let avatar = UIImage(data: data!)
        DispatchQueue.main.async {
          self.avatarView.image = avatar
        }
      }
    }
  }
}

