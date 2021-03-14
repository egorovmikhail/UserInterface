//
//  NewsVC.swift
//  VK
//
//  Created by Михаил Егоров on 28.02.2021.
//  Copyright © 2021 Михаил Егоров. All rights reserved.
//

import UIKit

class NewsVC: UIViewController {
  
  @IBOutlet weak var newsTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    newsTableView.dataSource = self
  }
  
}

extension NewsVC: UITableViewDataSource{
  
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let authorNewsCell = newsTableView.dequeueReusableCell(withIdentifier: "AuthorNewsCell", for: indexPath) as! AuthorNewsCell
    
    let newsTextCell = newsTableView.dequeueReusableCell(withIdentifier: "NewsTextCell", for: indexPath) as! NewsTextCell
    
    let newsImageCell = newsTableView.dequeueReusableCell(withIdentifier: "NewsImageCell", for: indexPath) as! NewsImageCell
    
    let newsFooterCell = newsTableView.dequeueReusableCell(withIdentifier: "NewsFooterCell", for: indexPath) as! NewsFooterCell
    
    switch indexPath.row {
      case 0:
        return authorNewsCell
      case 1:
        return newsTextCell
      case 2:
        return newsImageCell
      case 3:
        return newsFooterCell
      default:
        return UITableViewCell()
    }
  }
  
}
