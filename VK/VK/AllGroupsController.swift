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

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return groups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as! AllGroupsCell

        cell.allGroupsName.text = groups[indexPath.row]

        return cell
    }
    
}
