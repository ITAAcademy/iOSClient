//
//  FirstScreenPresenter.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/3/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import UIKit

class FirstScreenPresenter: FirstScreenPresenterProtocol {

    
    var interactor: FirstScreenInteractorProtocol!
    var router: FirstScreenRouterProtocol!
    weak var view: FirstScreenViewProtocol!
    
    
    enum States {
        case empty
        case loading
        case loaded(items: [ProductListItemProtocol])
        case error(error: Error)
    }
    
    
    
    func viewLoaded() {
        view.isUpperHidden = true
        view.showBottom(controller: router.getLoadingScreen())
        view.showUpper(controller: UIViewController())
        interactor.getProductList()
    }
    
    
    
    func show(products: [ProductListItemProtocol]) {
        if let controller = router?.getProductListController(with: products)
        {
            DispatchQueue.main.async { [weak self] in
                self?.view?.showBottom(controller: controller)
            }
            
        }
    }
    
    
}
