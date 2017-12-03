//
//  StoresDataProvider.swift
//  iOSKavadriveSDK
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation


class StoresDataProvider
{

    private class DumbStoreGenerator
    {
        class func generate(count: UInt) -> [StoreProtocol]
        {
            return(0..<count).map({ (index) -> StoreProtocol in
                return DumbStore()
            })
        }
    }
    
    public func get(completion: @escaping ([StoreProtocol])->(), error: (Error)->())
    {
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 10 ) {
            completion(DumbStoreGenerator.generate(count: 20))
        }
    }
}
