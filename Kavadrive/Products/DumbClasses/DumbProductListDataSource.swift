//
//  DumbProductListDataSource.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import UIKit


class DumbProductListDataSource: ProductListDataSourceProtocol
{
    required init(eventHandler: ProductItemCellEventHandlerProtocol) {
        
    }
    
    func cell(for tableView: UITableView, at: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductListTableViewCell.CellIdentifier)
        (cell as? ProductListTableViewCell)?.configure(item: DumbProductListItem())
        return cell ?? UITableViewCell()
    }
    
    
    
    var count: Int
    {
        return 100
    }
    
    
    func registerCells(for tableView: UITableView) {
        tableView.register(ProductListTableViewCell.NibCell, forCellReuseIdentifier: ProductListTableViewCell.CellIdentifier)
    }
}
