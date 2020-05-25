//
//  MyGroupsController.swift
//  VK
//
//  Created by Михаил Егоров on 01.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

class MyGroupsController: UIViewController {
    
    @IBOutlet weak var myGroupsView: UITableView!
    
    var groups = [GroupStatic]()
    var group = [GroupItem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        APIReguests().gruopGet(completion: {[weak self] group in
            self?.group = group
            self?.myGroupsView.reloadData()
        })
        myGroupsView.dataSource = self
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            let allGroupsController = segue.source as! AllGroupsController
            if let indexPath = allGroupsController.allGroupsView.indexPathForSelectedRow {
                let group = allGroupsController.groups[indexPath.row]
                if !groups.contains(group) {
                    groups.append(group)
                    myGroupsView.reloadData()
                }
            }
        }
    }
}

extension MyGroupsController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return group.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsCell", for: indexPath) as! MyGroupsCell

        cell.myGroupsName.text = group[indexPath.row].name
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
    

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            group.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
