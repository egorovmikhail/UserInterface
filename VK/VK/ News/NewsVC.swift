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
      self.newsTableView.reloadData()
      dump(self.items)
//      dump(self.profiles)
//      dump(self.groups)
//      dump(self.nextFrom)
    }
    newsTableView.dataSource = self
  }
  
}

extension NewsVC: UITableViewDataSource{
  
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    //    MARK: - authorNewsCell
    let authorNewsCell = newsTableView.dequeueReusableCell(withIdentifier: "AuthorNewsCell", for: indexPath) as! AuthorNewsCell
    let id = items[indexPath.section].sourceid
    DispatchQueue.global().async {
      self.groups.forEach { i in
        if "-" + "\(i.id)" == "\(id)" {
          if let url = URL(string: String(i.photo50)) {
            let data = try? Data(contentsOf: url)
            let avatar = UIImage(data: data!)
            DispatchQueue.main.async {
              authorNewsCell.authorNews.text = i.name
              authorNewsCell.avatarView.image = avatar
            }
          }
        }
      }
    }
    
    
    
    //    MARK: - newsTextCell
    let newsTextCell = newsTableView.dequeueReusableCell(withIdentifier: "NewsTextCell", for: indexPath) as! NewsTextCell
    newsTextCell.newsText.text = items[indexPath.section].text
    
    
    //    MARK: - newsImageCell
    let newsImageCell = newsTableView.dequeueReusableCell(withIdentifier: "NewsImageCell", for: indexPath) as! NewsImageCell

    DispatchQueue.global().async {
      guard (self.items[indexPath.section].attachments![0].photo?.sizes[6].url) != nil else {return}
      if let url = URL(string: String((self.items[indexPath.section].attachments![0].photo?.sizes[0].url)!)) {
        let data = try? Data(contentsOf: url)
//        guard let data = data else {return}
        let photo = UIImage(data: data!)
        DispatchQueue.main.async {
          newsImageCell.photoNews.image = photo
        }
      }
    }
    
    
    //    MARK: - newsFooterCell
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
