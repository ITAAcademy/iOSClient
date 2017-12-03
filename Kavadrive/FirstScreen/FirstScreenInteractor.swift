//
//  FirstScreenInteractor.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/3/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation


class FirstScreenInteractor: FirstScreenInteractorProtocol {
    weak var presenter: FirstScreenPresenterProtocol!
    
    
    private class DumbListGenerator
    {
        class func generate(count: UInt) -> [ProductListItemProtocol]
        {
            return (0..<count).map({ (index) -> ProductListItemProtocol in
                return DumbProductListItem()
            })
        }
    }
    

    
    
    func getProductList(completion: @escaping ([ProductListItemProtocol]) -> ()) {
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 10 ) {
            completion(DumbListGenerator.generate(count: 100))
        }
    }
    
    
}
