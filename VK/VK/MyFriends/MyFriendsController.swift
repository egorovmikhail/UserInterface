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
    @IBOutlet weak var friedSearchBar: UISearchBar!
    
    var sortedFriend = user
    var friendSection = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friedSearchBar.delegate = self
        sortedFriends(friends: sortedFriend)
    }
}

extension MyFriendsController: UITableViewDataSource, UISearchBarDelegate {
    
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
                let friendIndex = myFriendsView.indexPathForSelectedRow!
                vc.friend = friendSection[friendIndex.section].items[friendIndex.row]
            }
        }
    }
    
    func sortedFriends(friends: [User]) {
        let userDictionary = Dictionary(grouping: friends, by: {$0.name!.prefix(1)})
        friendSection = userDictionary.map{Section(title: String($0.key), items: $0.value)}
        friendSection.sort{$0.title < $1.title}
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            sortedFriends(friends: sortedFriend)
        } else {
            let filteredFriend = sortedFriend.filter { (friend: User) -> Bool in
                return (friend.name?.lowercased().contains(searchText.lowercased()))!
            }
            sortedFriends(friends: filteredFriend)
        }
        myFriendsView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        sortedFriends(friends: sortedFriend)
        friedSearchBar.text = nil
        view.endEditing(true)
        myFriendsView.reloadData()
    }
    
}

