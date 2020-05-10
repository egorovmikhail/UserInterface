//
//  NewsController.swift
//  VK
//
//  Created by Михаил Егоров on 10.05.2020.
//  Copyright © 2020 Михаил Егоров. All rights reserved.
//

import UIKit

class NewsController: UIViewController {
    
    @IBOutlet weak var newsView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsView.dataSource = self

    }
}

extension NewsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
//        cell.name.text =
//        cell.avatar.image =
        cell.newsPhoto.image = UIImage(named: "healthyLifestyle")
        return cell
    }
    
    
}
