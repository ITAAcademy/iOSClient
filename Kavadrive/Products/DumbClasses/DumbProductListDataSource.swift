//
//  DumbProductListDataSource.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import UIKit


class DumbProductListDataSource: ArrayBasedDataSourceTemplate<ProductListTableViewCell, ProductListItemProtocol>, ProductListDataSourceProtocol
{
   
    required init(items: [ProductListItemProtocol], eventHandler: ProductItemCellEventHandlerProtocol) {
        super.init()
        self.updateWith(array: items)
    }
    
    override func cell(for tableView: UITableView, at: IndexPath) -> UITableViewCell {
        let cell = super.cell(for: tableView, at: at)
        (cell as? ProductListTableViewCell)?.configure(item: DumbProductListItem())
        return cell
    }

}
