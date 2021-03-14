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
  
  var items = [Item]()
  var profiles = [Profile]()
  var groups = [GroupNews]()
  var nextFrom: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    APIReguests().newsGet(){ items, profiles, groups, nextFrom in
      self.items = items
      self.profiles = profiles
      self.groups = groups
      self.nextFrom = nextFrom
      dump(self.items)
      dump(self.profiles)
      dump(self.groups)
      dump(self.nextFrom)
    }
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
