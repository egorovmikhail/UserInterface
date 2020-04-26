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
    
    var friendDictionary = [String: [User]]()
    var friendSection = [String]()
    var friends = [
        User(name: "Аля", avatar: UIImage(named: "alya") , photo: [UIImage(named: "alya"), UIImage(named: "defaultPhoto")]),
        User(name: "Андрей", avatar: UIImage(named: "andrey"), photo: [UIImage(named: "andrey")]),
        User(name: "Дарья", avatar: UIImage(named: "dariya"), photo: [UIImage(named: "dariya")]),
        User(name: "Маша", avatar: UIImage(named: "masha"), photo: [UIImage(named: "masha")]),
        User(name: "Олег", avatar: UIImage(named: "oleg"), photo: [UIImage(named: "oleg")]),
        User(name: "Ольга", avatar: UIImage(named: "olga"), photo: [UIImage(named: "olga")]),
        User(name: "Рома", avatar: UIImage(named: "roma"), photo: [UIImage(named: "roma")]),
        User(name: "Саша", avatar: UIImage(named: "sasha"), photo: [UIImage(named: "sasha")]),
        User(name: "Сергей", avatar: UIImage(named: "sergey"), photo: [UIImage(named: "sergey")]),
        User(name: "Слава", avatar: UIImage(named: "slava"), photo: [UIImage(named: "slava")]),
        User(name: "Софья", avatar: UIImage(named: "sofya"), photo: [UIImage(named: "sofya")]),
        User(name: "Толя", avatar: UIImage(named: "tolya"), photo: [UIImage(named: "tolya")])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFriendsView.dataSource = self
        
        friendDictionary = Dictionary(grouping: friends, by: {String(($0.name?.first!)!)})

        friendSection = [String](friendDictionary.keys)
        friendSection = friendSection.sorted { $0 < $1 }        
    }
}

extension MyFriendsController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return friendSection.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let friendKey = friendSection[section]
        if let friendValues = friendDictionary[friendKey] {
            return friendValues.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendSection[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsCell", for: indexPath) as! MyFriendsCell

        let friendKey = friendSection[indexPath.section]
        if let friendValues = friendDictionary[friendKey] {
            cell.myFriendsName?.text = friendValues[indexPath.row].name
            cell.avatarView.image = friendValues[indexPath.row].avatar
        }

        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendSection
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFriendPhoto" {
            if let vc = segue.destination as? MyFriendsController {
//                vc.friend = friends[tableView.indexPathForSelectedRow!.row]
            }
        }
    }
}
