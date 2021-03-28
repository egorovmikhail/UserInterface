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
    myFriendsView.delegate = self
    myFriendsView.dataSource = self
    
    loadData()
    sortedFriends(friends: user)
    
    myFriendsView.register(MyFriendsCell.self, forCellReuseIdentifier: "MyFriendsCell")
    myFriendsView.rowHeight = 68
    
    APIReguests().friendGet() { [weak self] in
      self?.loadData()
      self?.sortedFriends(friends: self!.user)
      self?.myFriendsView.reloadData()
    }
    
    friedSearchBar.delegate = self
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
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
    //            имя
    var name: String = friendSection[indexPath.section].items[indexPath.row].firstName
    name += friendSection[indexPath.section].items[indexPath.row].lastName
    cell.labelName.text = name
    
    //    cell.fullName(friendSection: friendSection)
    
    photoService.getPhoto(urlString: friendSection[indexPath.section].items[indexPath.row].avatar) { avatar in
      DispatchQueue.main.async {
        cell.avatarView.image = avatar
      }
    }
    
    return cell
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

extension MyFriendsController: UITableViewDelegate{
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedTrail = friendSection[indexPath.section].items[indexPath.row]
    
    if let vс = storyboard?.instantiateViewController(identifier: "FriendsPhotoController") as? FriendsPhotoController {
      vс.friend = selectedTrail
      navigationController?.pushViewController(vс, animated: true)
    }
  }
}
