//
//  MyFriendsCell.swift
//  VK
//
//  Created by Михаил Егоров on 01.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

class MyFriendsCell: UITableViewCell {
  
  private let instets: CGFloat = 12.0
  let avatarSide: CGFloat = 44.0
 
  var friendSection = [Section]()
  
  var myFriendsName: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 17)
    label.backgroundColor = .systemBackground
    return label
  }()
  
  var avatarView: AvatarView = {
    let avatar = AvatarView()
    avatar.translatesAutoresizingMaskIntoConstraints = false
    avatar.contentMode = .scaleAspectFit
    return avatar
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(avatarView)
    contentView.addSubview(myFriendsName)
  }
 
  required init?(coder: NSCoder) {
      super.init(coder: coder)
      
  }

  func configure() {
    
  }
}

