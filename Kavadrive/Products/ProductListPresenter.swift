//
//  ProductListPresenter.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation

class ProductListPresenter: ProductListPresenterProtocol, EmbeddedPresenterProtocol
{
    var delegate: EmbeddedPresenterDelegate?
    
    
    var router: ProductListRouterProtocol!
    var interactor: ProductListInteractorProtocol!
    weak var view: ProductListViewProtocol!
    
    private var dataSource: ProductListDataSourceProtocol
    private var viewScrollThreshhold: Float = 0
    
    
    func viewLoaded() {
        if let tableView = view as? BaseTableViewProtocol
        {
            tableView.set(dataSource: dataSource)
        }
        viewScrollThreshhold = view.scrollThresholdPreffered
    }
    
    init(items:[ProductListItemProtocol]) {
        dataSource = ProductListDataSource(items: items, eventHandler:DumbProductItemCellEventHandler())
    }

    func viewDidScroll(offset: Float) {
        guard viewScrollThreshhold > 0 && offset > viewScrollThreshhold else { return }
        delegate?.addSpace(for: self)
    }
    
    
}
