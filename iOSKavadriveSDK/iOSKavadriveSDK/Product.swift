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
    var id: Int  { get }
    var name: String { get }
    var amount: Int { get }
    var price: Double { get }
    var image: URL? { get }
    var typeId: Int { get }
    var typeName: String { get }
    var categoryId: Int { get }
    var categoryName: String { get }
    var sequenceNumber: Int { get }
    var descriprion: String { get }
    var links: [URL] { get }
}

public struct DumbProduct: ProductProtocol
{
    public var image: URL?

    public var descriprion: String { return "Dumb Description" }
    
    public var links: [URL] = []
    
    public var id: Int { return 1 }
    
    public var name: String { return "Dumb Name" }
    
    public var amount: Int { return 1 }
    
    public var price: Double { return 1 }
    
    public var typeId: Int { return 1 }
    
    public var typeName: String { return "Dumb Type Name" }
    
    public var categoryId: Int { return 1 }
    
    public var categoryName: String { return "Dumb Category Name" }
    
    public var sequenceNumber: Int { return 1 }
    
}


