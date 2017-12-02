//
//  ProductListModuleBuilder.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import UIKit

struct ProductListModuleBuilder
{
    func buildView() -> UIViewController
    {
        let storyboard = UIStoryboard(name: "ProductList", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ProductListTableViewController")
        setPresenter(controller: controller)
        return controller
    }
    
    
    private func setPresenter(controller: UIViewController)
    {
        guard let controller = controller as? ProductListViewProtocol else { return }
        controller.presenter = nil
    }
    
    
    
}
