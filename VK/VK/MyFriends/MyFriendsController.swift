//
//  MyFriendsController.swift
//  VK
//
//  Created by Михаил Егоров on 01.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

class MyFriendsController: UIViewController {
    
    @IBOutlet weak var myFriendsView: UITableView!
    
    var sortedFriend = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sortedFriend = user.sorted {
            var isSorted = false
            if let first = $0.name,
                let second = $1.name {
                isSorted = first < second
            }
            return isSorted
        }        
    }
}

extension MyFriendsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedFriend.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsCell", for: indexPath) as! MyFriendsCell
        cell.myFriendsName.text = sortedFriend[indexPath.row].name
        cell.avatarView.image = sortedFriend[indexPath.row].avatar
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFriendsPhoto" {
            if let vc = segue.destination as? FriendsPhotoController {
                let friendIndex = myFriendsView.indexPathForSelectedRow?.row
                vc.friend = sortedFriend[friendIndex!]
            }
        }
    }
}

