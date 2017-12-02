//
//  ProductListInteractorProtocol.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation

protocol ProductListInteractorProtocol: class {
    var presenter: ProductListPresenterProtocol! { get set }
    func getProductList(completion: @escaping ([ProductListItemProtocol])->())
}
