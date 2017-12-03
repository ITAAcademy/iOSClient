//
//  Product.swift
//  iOSKavadriveSDK
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation


public protocol ProductProtocol
{
    var name: String { get }
}

public struct DumbProduct: ProductProtocol
{
    public var name: String { return "Dumb Name" }
}


