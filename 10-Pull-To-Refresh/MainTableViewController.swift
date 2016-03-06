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

        clearsSelectionOnViewWillAppear = false
        
        addRefreshControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addRefreshControl() {
        
        refreshControl = UIRefreshControl()
        
        guard let pullToRefresh = refreshControl else {
            return
        }
        
        pullToRefresh.addTarget(self, action: #selector(MainTableViewController.refresh), forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(pullToRefresh)
    }
    
    func refresh() {
        loadData()
        
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    func loadData() {
        dataSource += ["Fish", "Carrots", "Bread", "Chicken", "Watter"]
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
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

        return cell
    }
}
