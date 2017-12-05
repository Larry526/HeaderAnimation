//
//  MasterViewController.swift
//  HeaderAnimation
//
//  Created by Larry Luk on 2017-12-05.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var objects = [NewsItem]()
    var headerView : UIView!
    var kTableHeaderHeight : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - UI Stuff
        kTableHeaderHeight = view.frame.height/7 * 3
        
        headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: kTableHeaderHeight)
        headerView.backgroundColor = .black
//        headerView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.tableHeaderView = headerView
        tableView.addSubview(headerView)
        
        let imageView = UIImageView(image: (UIImage (named: "header")))
        headerView.addSubview(imageView)
        imageView.frame = headerView.frame
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        
        let imageViewVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageView]|", options: [], metrics: nil, views: ["imageView": imageView])
        headerView.addConstraints(imageViewVerticalConstraints)
        let imageViewHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|[imageView]|", options: [], metrics: nil, views: ["imageView": imageView])
        headerView.addConstraints(imageViewHorizontalConstraints)
        
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd"
        let result = formatter.string(from: date)
        
        let dateLabel = UILabel()
        dateLabel.frame = CGRect(x: 10, y: 0, width: view.frame.width/2, height: view.frame.height/4)
        imageView.addSubview(dateLabel)
        dateLabel.text = result
        dateLabel.textColor = .white
        
        self.navigationController?.isNavigationBarHidden = true
        
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
        
        // MARK: - Initialze newsItems
        
        let newsItem1 = NewsItem(category: "World", headline: "Climate change protests, divestments meet fossil fuels realities", categoryColour: UIColor.red)
        let newsItem2 = NewsItem(category: "Europe", headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime", categoryColour: UIColor.green)
        let newsItem3 = NewsItem(category: "Middle East", headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible", categoryColour: UIColor.yellow)
        let newsItem4 = NewsItem(category: "Africa", headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim", categoryColour: UIColor.orange)
        let newsItem5 = NewsItem(category: "Asia Pacific", headline: "Despite UN ruling, Japan seeks backing for whale hunting", categoryColour: UIColor.purple)
        let newsItem6 = NewsItem(category: "Americas", headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria", categoryColour: UIColor.blue)
        var newsItem7 = newsItem1
        newsItem7.headline = "South Africa in $40 billion deal for Russian nuclear reactors"
        var newsItem8 = newsItem2
        newsItem8.headline = "One million babies' created by EU student exchanges"
        objects.append(contentsOf: [newsItem1, newsItem2, newsItem3, newsItem4, newsItem5, newsItem6, newsItem7, newsItem8])
        
        
    }
    
    func updateHeaderView () {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    struct NewsItem {
        var category : String
        var headline : String
        var categoryColour : UIColor
    }
    
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell
        
        let object = objects[indexPath.row]
        cell?.categoryLabel.text = object.category
        cell?.categoryLabel.textColor = object.categoryColour
        cell?.headlineLabel.text = object.headline
        
        return cell!
    }
    
    
}

