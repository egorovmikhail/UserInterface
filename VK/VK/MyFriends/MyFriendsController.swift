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
    
    var sortedFriend = user
    var friendSection = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortedFriends(friends: sortedFriend)
    }
}

extension MyFriendsController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return friendSection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        friendSection[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendSection[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsCell", for: indexPath) as! MyFriendsCell
        cell.myFriendsName.text = friendSection[indexPath.section].items[indexPath.row].name
        cell.avatarView.image = friendSection[indexPath.section].items[indexPath.row].avatar
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
    
    func sortedFriends(friends: [User]) {
        let userDictionary = Dictionary(grouping: friends, by: {$0.name!.prefix(1)})
        friendSection = userDictionary.map{Section(title: String($0.key), items: $0.value)}
        friendSection.sort{$0.title < $1.title}
    }
    
}

