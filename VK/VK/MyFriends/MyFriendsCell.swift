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
  
  var avatarView: AvatarView! = {
    let avatar = AvatarView()
    avatar.translatesAutoresizingMaskIntoConstraints = false
    avatar.frame = CGRect(x: 0.0, y: 70.0, width: 44.0, height: 44.0)
    avatar.contentMode = .scaleAspectFit
    return avatar
  }()
  
  override func prepareForReuse() {
      super.prepareForReuse()
      avatarView.image = nil
      myFriendsName.text = nil
      setNeedsLayout()
  }
  
  override func layoutSubviews() {
      super.layoutSubviews()
    addSubview(myFriendsName)
    addSubview(avatarView)
  }
  
  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
    
  }

  func configure() {
    
  }
}

