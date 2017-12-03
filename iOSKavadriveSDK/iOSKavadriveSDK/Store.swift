//
//  Store.swift
//  iOSKavadriveSDK
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation


public protocol StoreProtocol
{
    var storeName: String { get }
}

public struct DumbStore: StoreProtocol
{
    public var storeName: String { return "Dumb StoreName" }
}
