//
//  MasterViewController.swift
//  HeaderAnimation
//
//  Created by Larry Luk on 2017-12-05.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [NewsItem]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
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

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

