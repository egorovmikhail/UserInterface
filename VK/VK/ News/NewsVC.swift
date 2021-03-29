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
  let dotLoadView = DotLoadView()
  
  var items = [Item]()
  var profiles = [Profile]()
  var groups = [GroupNews]()
  var nextFrom: String = ""
  var isPrefetch: Bool = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    APIReguests().newsGet(startTime: nil, nextFrom: ""){[weak self] items, profiles, groups, nextFrom in
      self?.items = items
      self?.profiles = profiles
      self?.groups = groups
      self?.nextFrom = nextFrom
      self?.newsTableView.reloadData()
    }
    newsTableView.dataSource = self
    newsTableView.prefetchDataSource = self
    dotLoadView.frame = CGRect(x: newsTableView.bounds.maxX / 2, y: newsTableView.bounds.maxY / 2, width: newsTableView.bounds.width, height: newsTableView.bounds.height)
    configurateRefreshControl()
  }
  //  MARK: - configurateRefreshControl
  private func configurateRefreshControl(){
    newsTableView.refreshControl = UIRefreshControl()
    newsTableView.refreshControl?.tintColor = .red
    newsTableView.refreshControl?.attributedTitle = NSAttributedString(string: "Refreshing...")
    newsTableView.refreshControl?.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
  }
  
  //  MARK: - View action
  @objc
  private func refreshTableView(){
    APIReguests().newsGet(startTime: nil, nextFrom: ""){[weak self] items, profiles, groups, nextFrom in
      self?.items = items
      self?.profiles = profiles
      self?.groups = groups
      self?.newsTableView.reloadData()
      self?.newsTableView.refreshControl?.endRefreshing()
      self?.newsTableView.reloadData()
    }
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
//    print("\(items[indexPath.section].text)")
    
    
    //    MARK: - newsImageCell
    let newsImageCell = newsTableView.dequeueReusableCell(withIdentifier: "NewsImageCell", for: indexPath) as! NewsImageCell
    
    DispatchQueue.global().async {
      guard ((self.items[indexPath.section].attachments?.isEmpty) != nil) else {return}
      if let url = self.items[indexPath.section].attachments![0].photo?.sizes[0].url {
        if let url = URL(string: String(url)) {
          let data = try? Data(contentsOf: url)
          //          guard let data = data else {return}
          let photo = UIImage(data: data!)
          DispatchQueue.main.async {
            newsImageCell.photoNews.image = photo
          }
        }
      }
    }
    
    
    //    MARK: - newsFooterCell
    let newsFooterCell = newsTableView.dequeueReusableCell(withIdentifier: "NewsFooterCell", for: indexPath) as! NewsFooterCell
    
    switch indexPath.row {
      case 0:
        newsTableView.rowHeight = 68
        return authorNewsCell
      case 1:
        if items[indexPath.section].text.isEmpty{
          newsTableView.rowHeight = 0
          return UITableViewCell()
        } else {
          newsTableView.rowHeight = 100
          return newsTextCell
        }
      case 2:
        if items[indexPath.section]
          .attachments != nil,
           items[indexPath.section]
              .attachments![0].photo?
              .sizes[0].url != nil{
          newsTableView.rowHeight = 200
          return newsImageCell
        } else {
          newsTableView.rowHeight = 0
          return UITableViewCell()
        }
      case 3:
        newsTableView.rowHeight = 44
        return newsFooterCell
      default:
        newsTableView.rowHeight = 0
        return UITableViewCell()
    }
  }
}

extension NewsVC: UITableViewDataSourcePrefetching{
  func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
    guard let maxSection = indexPaths.map({$0.section}).max() else {return}
    print("#######maxSection##\(maxSection)##########")
    
    if maxSection > items.count - 2, !isPrefetch {
      isPrefetch = true
      newsTableView.addSubview(dotLoadView)
      APIReguests().newsGet(startTime: nil, nextFrom: nextFrom){ [weak self] items, profiles, groups, nextFrom in
        self?.items += items
        self?.profiles += profiles
        self?.groups += groups
        self?.nextFrom = nextFrom
        self?.dotLoadView.removeFromSuperview()
        self?.newsTableView.reloadData()
        self?.isPrefetch = false
      }
    } else {
      dotLoadView.removeFromSuperview()
    }
    
  }
  
  
}

//    MARK: - UITableViewDelegate
//extension NewsVC: UITableViewDelegate {
//
//  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    switch indexPath.row {
//      case 0:
//        return 68
//      case 1:
//
//        return 200
//      case 2:
//        return 100
//      case 3:
//        return 44
//      default:
//        return 0
//    }
//  }
//
//}
