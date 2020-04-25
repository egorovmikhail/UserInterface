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
    
    var friendDictionary = [String: [Friend]]()
    var friendSection = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFriendsView.dataSource = self
        
        for i in friends {
            let friendKey = String(i.name!.prefix(1))
            if var friendValues = friendDictionary[friendKey] {
                friendValues.append(i)
                friendDictionary[friendKey] = friendValues
            } else {
                friendDictionary[friendKey] = [i]
            }
        }

        friendSection = [String](friendDictionary.keys)
        friendSection = friendSection.sorted(by: { $0 < $1 })
        
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
    
}
