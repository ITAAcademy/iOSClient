//
//  ProductListPresenter.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import UIKit


struct DumbProductItemCellEventHandler: ProductItemCellEventHandlerProtocol
{
    
}

struct DumbProductListItem: ProductListItemProtocol
{    
    var name: String
    {
        return "Name"
    }
}

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
        return 0
    }
    
    
    func registerCells(for tableView: UITableView) {
        tableView.register(ProductListTableViewCell.NibCell, forCellReuseIdentifier: ProductListTableViewCell.CellIdentifier)
    }
}


class ProductListPresenter: ProductListPresenterProtocol
{
    func viewLoaded() {
        if let tableView = view as? ProductListTableViewProtocol
        {
            tableView.set(dataSource: DumbProductListDataSource(eventHandler:DumbProductItemCellEventHandler()))
        }
    }
    
    var router: ProductListRouterProtocol!
    
    var interactor: ProductListInteractorProtocol!
    
    weak var view: ProductListViewProtocol!
}
