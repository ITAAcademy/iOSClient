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

    private var lastOffset: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
    }
    
    
    var scrollThresholdPreffered: Float
    {
        return Float(view.bounds.maxY / 10)
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let delta = Float(scrollView.contentOffset.y - lastOffset)
        lastOffset = scrollView.contentOffset.y
        if delta > 0
        {
            presenter.viewDidScroll(offset: delta)
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let delta = Float(scrollView.contentOffset.y - lastOffset)
        if delta < 0
        {
            presenter.viewDidScroll(offset: delta)
            lastOffset = scrollView.contentOffset.y
        }
        
    }
    
}



