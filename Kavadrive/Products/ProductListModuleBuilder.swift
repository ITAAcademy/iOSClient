//
//  ProductListModuleBuilder.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import UIKit




struct ProductListModuleBuilder: ModuleBuilderProtocol
{
    private class DumbListGenerator
    {
        class func generate(count: UInt) -> [ProductListItemProtocol]
        {
            return (0..<count).map({ (index) -> ProductListItemProtocol in
                return DumbProductListItem()
            })
        }
    }
    
    private var items: [ProductListItemProtocol] = DumbListGenerator.generate(count: 100)
    
    
    
    func buildView() -> UIViewController
    {
        let storyboard = UIStoryboard(name: "ProductList", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ProductListTableViewController")
        configure(controller: controller)
        return UINavigationController(rootViewController: controller)
    }
    
    mutating func set(items:[ProductListItemProtocol])
    {
        self.items = items
    }
    
    private func configure(controller: UIViewController)
    {
        guard let controller = controller as? ProductListViewProtocol else { return }
        controller.presenter = ProductListPresenter(items: items)
        controller.presenter.view = controller
        controller.presenter.interactor = ProductListInteractor()
        controller.presenter.interactor.presenter = controller.presenter
    }
    
    
    
}
