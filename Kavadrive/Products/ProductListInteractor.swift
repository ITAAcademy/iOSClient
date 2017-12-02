//
//  ProductListInteractor.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation


class ProductListInteractor: ProductListInteractorProtocol {

    
    weak var presenter: ProductListPresenterProtocol!
    
    func getProductList(completion: @escaping ([ProductListItemProtocol])->())
    {
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 10 ) {
            completion([])
        }
    }
}
