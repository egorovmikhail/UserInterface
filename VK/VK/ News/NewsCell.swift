//
//  NewsCell.swift
//  VK
//
//  Created by Михаил Егоров on 10.05.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    @IBOutlet weak var avatar: AvatarView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var newsPhoto: UIImageView!
    @IBOutlet weak var newsLike: UIView!
    @IBOutlet weak var newsComment: UIView!
    @IBOutlet weak var newsShare: UIView!
    @IBOutlet weak var howManyViews: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
