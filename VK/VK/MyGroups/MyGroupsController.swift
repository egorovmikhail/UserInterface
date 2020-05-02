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
    
    var groups: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        return groups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsCell", for: indexPath) as! MyGroupsCell

        cell.myGroupsName.text = groups[indexPath.row].name
        cell.avatarView.image = groups[indexPath.row].avatar

        return cell
    }
    

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
