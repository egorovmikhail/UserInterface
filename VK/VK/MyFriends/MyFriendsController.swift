//
//  MyFriendsController.swift
//  VK
//
//  Created by Михаил Егоров on 01.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit
import RealmSwift

class MyFriendsController: UIViewController {
  
  @IBOutlet weak var myFriendsView: UITableView!
  @IBOutlet weak var friedSearchBar: UISearchBar!
  
  let photoService: PhotoService = {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    return appDelegate?.photoService ?? PhotoService()
  }()
  
  var friendSection = [Section]()
  var user = [UserItem]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
    sortedFriends(friends: user)
//    myFriendsView.register(MyFriendsCell.self, forCellReuseIdentifier: "MyFriendsCell")

    
    myFriendsView.rowHeight = 72
    
    APIReguests().friendGet() { [weak self] in
      self?.loadData()
      self?.sortedFriends(friends: self!.user)
      self?.myFriendsView.reloadData()
    }
    friedSearchBar.delegate = self
  }
  
  func loadData() {
    do {
      let realm = try Realm()
      
      let users = realm.objects(UserItem.self)
      
      self.user = Array(users)
      //            print(user)
    } catch {
      print(error)
    }
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
    let cell = myFriendsView.dequeueReusableCell(withIdentifier: "MyFriendsCell", for: indexPath) as! MyFriendsCell
    //        имя
    var name: String = friendSection[indexPath.section].items[indexPath.row].firstName
    name += friendSection[indexPath.section].items[indexPath.row].lastName
    cell.myFriendsName.text = name
    //        аватар
    //        if let url = URL(string: String(friendSection[indexPath.section].items[indexPath.row].avatar)) {
    //            DispatchQueue.global().async {
    //                let data = try? Data(contentsOf: url)
    //                let avatar = UIImage(data: data!)
    //                DispatchQueue.main.async {
    //                    cell.avatarView.image = avatar
    //                }
    //            }
    //        }
    photoService.getPhoto(urlString: friendSection[indexPath.section].items[indexPath.row].avatar) { avatar in
      DispatchQueue.main.async {
        cell.avatarView.image = avatar
      }
    }
    
    //      cell.configure()
    
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
  
  func sortedFriends(friends: [UserItem]) {
    let userDictionary = Dictionary(grouping: friends, by: {$0.firstName.prefix(1)})
    friendSection = userDictionary.map{Section(title: String($0.key), items: $0.value)}
    friendSection.sort{$0.title < $1.title}
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    if searchText.isEmpty{
      sortedFriends(friends: user)
    } else {
      let filteredFriend = user.filter { (friend: UserItem) -> Bool in
        return (friend.firstName.lowercased().contains(searchText.lowercased()))
      }
      sortedFriends(friends: filteredFriend)
    }
    myFriendsView.reloadData()
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    sortedFriends(friends: user)
    friedSearchBar.text = nil
    view.endEditing(true)
    myFriendsView.reloadData()
  }
}
