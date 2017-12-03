//
//  FirstScreenInteractor.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/3/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import iOSKavadriveSDK

class SimpleProductListItem: ProductListItemProtocol
{
    var name: String
    
    init(product: ProductProtocol)
    {
        name = product.name
    }
}


class FirstScreenInteractor: FirstScreenInteractorProtocol {

    
    weak var presenter: FirstScreenPresenterProtocol!
    
    func getProductList() {
        let provider = ProductDataProvider()
        provider.get(completion: { (products) in
            self.presenter.show(products: products.map{SimpleProductListItem.init(product: $0)})
        }) { (error) in
            
        }
    }

    
}
