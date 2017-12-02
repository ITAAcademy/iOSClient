//
//  ProductListTableViewController.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import UIKit

class ProductListTableViewController: BaseTableViewController, ProductListViewProtocol {
    
    var presenter: ProductListPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
    }
}



