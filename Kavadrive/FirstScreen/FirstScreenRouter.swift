//
//  FirstScreenRouter.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/3/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import UIKit

class FirstScreenRouter: FirstScreenRouterProtocol {
    func getCheckout() -> UIViewController {
        let builder = SmallCheckoutModuleBuilder()
        return builder.buildView()
    }
    

    
    func getLoadingScreen() -> UIViewController {
        let storyboard = UIStoryboard(name: "FirstScreen", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LoadingScreen")
        return controller
    }
    
    
    func getProductListController(with items: [ProductListItemProtocol])->UIViewController  {
        var builder = ProductListModuleBuilder()
        builder.set(items: items)
        if let delegate = presenter as? EmbeddedPresenterDelegate
        {
            builder.setEmbeddedController(delegate: delegate)
        }
        return builder.buildView()
    }
    
    
    
    
    weak var presenter: FirstScreenPresenterProtocol!
    
    
}


