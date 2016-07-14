//
//  ArticleListViewController.swift
//  QiitaViewer
//
//  Created by Yuta Tadachi on 2015/12/06.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ArticleListViewController: UIViewController, UITableViewDataSource {
    var articles: [[String: String?]] = []
    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Githubユーザー一覧"
        
        table.frame = view.frame
        view.addSubview(table)
        table.dataSource = self
        
        getArticles()
    }
        
    func getArticles() {
        Alamofire.request(.GET, "https://api.github.com/users")
            .responseJSON { response in
                guard let object = response.result.value else {
                    return
                }
                
                let json = JSON(object)
                json.forEach { (_, json) in
                    let article: [String: String?] = [
                        "avatar": json["avatar_url"].string,
                        "name": json["login"].string
                    ]
                    self.articles.append(article)
                }
                self.table.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(tableView: UICollectionView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.performSegueWithIdentifier("showImage", sender: self)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell")
        let article = articles[indexPath.row]

        cell.textLabel?.text = article["avatar"]!
        cell.detailTextLabel?.text = article["name"]!
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "showImage"
        {
            let indexPaths = self.tableView!.indexPathsForSelectedRows()!
            let indexPath = indexPaths[0] as NSIndexPath
            let vc = segue.destinationViewController as! NewViewController
            vc.avatar = self.articles["avatar"][indexPath.row]!
            vc.name = self.articles["name"][indexPath.row]!
        }
    }
    
}
