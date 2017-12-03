//
//  ProductsDataProvider.swift
//  iOSKavadriveSDK
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation


public class ProductDataProvider
{
    
    
    private class DumbProductsGenerator
    {
        class func generate(count: UInt) -> [ProductProtocol]
        {
            return (0..<count).map({ (index) -> ProductProtocol in
                return DumbProduct()
            })
        }
    }
    
    public func get(completion: @escaping ([ProductProtocol])->(), error: (Error)->())
    {
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 10 ) {
            completion(DumbProductsGenerator.generate(count: 15))
        }
    }
    
    
    public init()
    {}
    
}
