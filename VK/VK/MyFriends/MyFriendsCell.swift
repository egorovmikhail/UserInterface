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
  let avatarSize: CGFloat = 44.0
  var indexPath = IndexPath(row: 0, section: 0)
  
  var friendSection = [Section]()
  
  //  MARK: - labelName
  var labelName: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 17)
    label.backgroundColor = .systemBackground
    return label
  }()
  //  MARK: - avatarView
  var avatarView: UIImageView = {
    let avatar = UIImageView()
    avatar.translatesAutoresizingMaskIntoConstraints = false
    avatar.contentMode = .scaleAspectFit
    return avatar
  }()
  //  MARK: - view
  var view: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = .scaleAspectFit
    return view
  }()
  //  MARK: - button
  let button: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.contentMode = .scaleAspectFit
    return button
  }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupSubviews()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupSubviews()
  }
  //  MARK: - prepareForReuse
  override func prepareForReuse() {
    super.prepareForReuse()
    avatarView.image = nil
    labelName.text = nil
    setNeedsLayout()
  }
  //  MARK: - layoutSubviews
  override func layoutSubviews() {
    super.layoutSubviews()
    setLabelFrame()
    setupAvatarView()
  }
  //  MARK: - setupSubviews
  private func setupSubviews() {
    addSubview(view)
    view.addSubview(avatarView)
    addSubview(button)
    addSubview(labelName)
  }
  
  //  MARK: - setupAvatarView
  
  func setupAvatarView(){
    view.frame = CGRect(x: instets, y: instets,
                        width: avatarSize, height: avatarSize)
    avatarView.frame = CGRect(x: 0, y: 0,
                              width: avatarSize, height: avatarSize)
    button.frame = CGRect(x: instets, y: instets,
                          width: avatarSize, height: avatarSize)
    button.addTarget(self, action: #selector(animateAuthButton​), for: .touchDown)
    
    //        Создаём контур и обрезаем катинку
    avatarView.layer.borderColor = UIColor.darkGray.cgColor
    avatarView.layer.borderWidth = 0.05
    avatarView.layer.cornerRadius = avatarView.bounds.height / 2
    avatarView.layer.masksToBounds = true
    
    //        Добавляем тень вокруг картинки
    view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOpacity = 0.5
    view.layer.shadowOffset = .zero
    view.layer.shadowRadius = 11
  }
  
  
  //  MARK: - setLabelFrame
  func setLabelFrame() {
    let size = getLabelSize(text: labelName.text ?? "",
                            font: labelName.font)
    let origin = CGPoint(x: ((bounds.width - size.width)/2).rounded(.down),
                         y: ((bounds.height - size.height)/2).rounded(.down))
    labelName.frame = CGRect(origin: origin,
                             size: size)
  }
  
  //  MARK: - getLabelSize
  func getLabelSize(text: String, font: UIFont) -> CGSize {
    let maxWidth = contentView.bounds.width
    let textBlock = CGSize(
      width: maxWidth,
      height: .greatestFiniteMagnitude)
    let rect = text.boundingRect(
      with: textBlock,
      options: .usesLineFragmentOrigin,
      attributes: [NSAttributedString.Key.font : font],
      context: nil)
    
    let width = rect.width.rounded(.up)
    let height = rect.height.rounded(.up)
    
    return CGSize(width: width,
                  height: height)
  }
  
  //  MARK: - fullName
  func fullName(friendSection: [Section]) {
    labelName.text = friendSection[indexPath.section].items[indexPath.row].firstName + friendSection[indexPath.section].items[indexPath.row].lastName
    
  }
  
  //  MARK: - animateAuthButton
  @objc func animateAuthButton​() {
    let animation = CASpringAnimation(keyPath: "transform.scale")
    animation.fromValue = 0.85
    animation.toValue = 1
    animation.stiffness = 200
    animation.mass = 2
    animation.duration = 2
    animation.beginTime = CACurrentMediaTime() + 0.2
    animation.fillMode = CAMediaTimingFillMode.backwards
    view.layer.add(animation, forKey: nil)
  }
}

