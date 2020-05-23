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
    
    var group = [GroupItem]()
        
    var groupsSearch = "1"
    
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
//        cell.avatarView.image = groups[indexPath.row].avatar
        
        return cell
    }
    
}
