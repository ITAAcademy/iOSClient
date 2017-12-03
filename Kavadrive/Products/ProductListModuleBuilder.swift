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

    
    private var items: [ProductListItemProtocol] = []
    private var embeddedControllerDelegate: EmbeddedPresenterDelegate?
    
    
    func buildView() -> UIViewController
    {
        let storyboard = UIStoryboard(name: "ProductList", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ProductListTableViewController")
        configure(controller: controller)
        return controller
    }
    
    mutating func set(items:[ProductListItemProtocol])
    {
        self.items = items
    }
    
    mutating func setEmbeddedController(delegate: EmbeddedPresenterDelegate)
    {
        embeddedControllerDelegate = delegate
    }
    
    private func configure(controller: UIViewController)
    {
        guard let controller = controller as? ProductListViewProtocol else { return }
        controller.presenter = ProductListPresenter(items: items)
        controller.presenter.view = controller
        controller.presenter.interactor = ProductListInteractor()
        controller.presenter.interactor.presenter = controller.presenter
        if let presenter = controller.presenter as? EmbeddedPresenterProtocol
        {
            presenter.delegate = embeddedControllerDelegate
        }
    }
    
    
    
}
