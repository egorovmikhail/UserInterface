//
//  MyGroupsController.swift
//  VK
//
//  Created by Михаил Егоров on 01.04.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit
import RealmSwift

class MyGroupsController: UIViewController {
    
    @IBOutlet var myGroupsView: UITableView!
    
    var token: NotificationToken?
    
//    var groups = [GroupItem]()
    var group: Results<GroupItem>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIReguests().gruopGet()
        pairTableAndRealm()
        myGroupsView.dataSource = self
    }
    
    func pairTableAndRealm() {
        guard let realm = try? Realm() else { return }
        group = realm.objects(GroupItem.self)
        token = group?.observe { [weak self] (changes: RealmCollectionChange) in
            guard let tableView = self?.myGroupsView else { return }
            switch changes {
            case .initial:
                tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                tableView.beginUpdates()
                tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                     with: .automatic)
                tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                tableView.endUpdates()
            case .error(let error):
                fatalError("\(error)")
            }
        }
    }
}

extension MyGroupsController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group?.count ?? 0
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsCell", for: indexPath) as! MyGroupsCell

        cell.myGroupsName.text = group![indexPath.row].name
        if let url = URL(string: String(group![indexPath.row].avatar)) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    cell.avatarView.image = UIImage(data: data!)
                }
            }
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            group.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
    }
    
}
