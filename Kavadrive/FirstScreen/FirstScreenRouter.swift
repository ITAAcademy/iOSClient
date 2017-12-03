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
    
    func getProductListController(with items: [ProductListItemProtocol])->UIViewController  {
        var builder = ProductListModuleBuilder()
        builder.set(items: items)
        return builder.buildView()
    }
    
    weak var presenter: FirstScreenPresenterProtocol!
    
    
}
