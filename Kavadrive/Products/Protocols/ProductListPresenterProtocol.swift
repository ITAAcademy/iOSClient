//
//  ProductListPresenterProtocol.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation

protocol ProductListPresenterProtocol: class {
    var view: ProductListViewProtocol! { get set }
    var router: ProductListRouterProtocol! { get set }
    var interactor: ProductListInteractorProtocol! { get set}
    
    
    
    func viewLoaded()
    func viewDidScroll(offset: Float)
}
