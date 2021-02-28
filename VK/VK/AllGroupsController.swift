//
//  AllGroupsController.swift
//  VK
//
//  Created by Михаил Егоров on 01.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

class AllGroupsController: UIViewController {
    
    @IBOutlet weak var allGroupsView: UITableView!

    
//    var groups = [GroupItem]()
    
    let groupsSearch = "1"
    
    var group = [GroupItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIReguests().groupsSearchGet(q: groupsSearch) {[weak self] group in
            self?.group = group
            self?.allGroupsView.reloadData()
        }
        allGroupsView.dataSource = self
    }
}

extension AllGroupsController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return group.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as! AllGroupsCell

        cell.allGroupsName.text = group[indexPath.row].name
        if let url = URL(string: String(group[indexPath.row].avatar)) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    cell.avatarView.image = UIImage(data: data!)
                }
            }
        }
        return cell
    }
    
    func searchGroup() {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            searchGroup()
        } else {
//            let filteredFriend = user.filter { (friend: UserItem) -> Bool in
//                return (friend.firstName.lowercased().contains(searchText.lowercased()))
//            }
            searchGroup()
        }
        allGroupsView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchGroup()
//        friedSearchBar.text = nil
        view.endEditing(true)
        allGroupsView.reloadData()
    }
    
}
