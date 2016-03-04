//
//  MainTableViewController.swift
//  10-Pull-To-Refresh
//
//  Created by vmalikov on 3/4/16.
//  Copyright © 2016 justForFun. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var dataSource = ["Milk", "Apples", "Ham", "Eggs"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = false
        
        addRefreshControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addRefreshControl() {
        if self.refreshControl == nil {
            self.refreshControl = UIRefreshControl()
        }
        self.refreshControl!.addTarget(self, action: #selector(MainTableViewController.refresh), forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(self.refreshControl!)
    }
    
    func refresh() {
        loadData()
        
        self.tableView.reloadData()
        self.refreshControl!.endRefreshing()
    }
    
    func loadData() {
        self.dataSource.append("Fish")
        self.dataSource.append("Carrots")
        self.dataSource.append("Bread")
        self.dataSource.append("Chicken")
        self.dataSource.append("Watter")
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        cell.textLabel?.text = dataSource[indexPath.row]

        return cell
    }
}
