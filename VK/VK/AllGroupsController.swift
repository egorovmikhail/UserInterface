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
    
    var groups = [
        "Сабаководы",
        "Любители кошек",
        "Мозг",
        "GeekBrains",
        "Мой город",
        "Здоровый образ",
        "Саморазвитие"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        allGroupsView.dataSource = self

    }

}

extension AllGroupsController: UITableViewDataSource {
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as! AllGroupsCell

        cell.allGroupsName.text = groups[indexPath.row]

        return cell
    }
    
}
