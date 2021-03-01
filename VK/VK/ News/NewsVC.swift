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

        // Do any additional setup after loading the view.
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
    
    
    var cell = UITableViewCell()
    
    if indexPath.row == 0 {
      cell = authorNewsCell
    }
    else if indexPath.row == 1 {
        cell = newsTextCell
    }
    else if indexPath.row == 2 {
        cell = newsImageCell
    }
    else if indexPath.row == 3 {
        cell = newsFooterCell
    }
    
    
    return cell
  }
  
//  private func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//    
//  }
  
  
}

    
