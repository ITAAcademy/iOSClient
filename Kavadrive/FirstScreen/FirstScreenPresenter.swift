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
        view.showBottom(controller: UIViewController())
        view.showUpper(controller: UIViewController())
        interactor.getProductList { [weak self](items) in
            if let controller = self?.router?.getProductListController(with: items)
            {
                DispatchQueue.main.async {
                    self?.view?.showBottom(controller: controller)
                }
                
            }
            
        }
    }
    
    
    
    
    
    
}
