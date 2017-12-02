//
//  BaseTableViewController.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//
import UIKit

class BaseTableViewController: UITableViewController, BaseTableViewProtocol {
    
    
    var dataSource: BaseTableDataSourceProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func set(dataSource: BaseTableDataSourceProtocol) {
        self.dataSource = dataSource
        self.dataSource.registerCells(for: tableView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSource.cell(for:tableView, at:indexPath)
    }
}
