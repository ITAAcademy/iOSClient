//
//  ProductListPresenter.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation

class ProductListPresenter: ProductListPresenterProtocol
{
    
    var router: ProductListRouterProtocol!
    var interactor: ProductListInteractorProtocol!
    weak var view: ProductListViewProtocol!
    
    private var dataSource: ProductListDataSourceProtocol
    
    func viewLoaded() {
        if let tableView = view as? BaseTableViewProtocol
        {
            tableView.set(dataSource: dataSource)
        }
    }
    
    init(items:[ProductListItemProtocol]) {
        dataSource = DumbProductListDataSource(items: items, eventHandler:DumbProductItemCellEventHandler())
    }

}
