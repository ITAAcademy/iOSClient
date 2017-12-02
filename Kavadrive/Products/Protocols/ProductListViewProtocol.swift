//
//  ProductListViewProtocol.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation

protocol ProductListViewProtocol: class {
    var presenter: ProductListPresenterProtocol! { get set }
    
}


protocol ProductListTableViewProtocol {
    func set(dataSource: ProductListDataSourceProtocol)
    var dataSource: ProductListDataSourceProtocol! { get set }
}
