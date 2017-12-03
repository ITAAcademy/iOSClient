//
//  FirstScreenPresenterProtocol.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/3/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation


protocol FirstScreenPresenterProtocol: class {
    var view: FirstScreenViewProtocol! { get set}
    var router: FirstScreenRouterProtocol! { get set }
    var interactor: FirstScreenInteractorProtocol! { get set }
    
    func viewLoaded()
    func show(products:[ProductListItemProtocol])
}
