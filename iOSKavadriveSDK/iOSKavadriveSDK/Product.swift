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
    var id: Int  { get set }
    var name: String { get set }
    var amount: String { get set }
    var price: Double { get set }
    var image: URL? { get set }
    var typeId: Int { get set }
    var typeName: String { get set }
    var categoryId: Int { get set }
    var categoryName: String { get set }
    var sequenceNumber: Int { get set }
    var description: String { get set }
    var links: [URL] { get set }
}

public struct DumbProduct: ProductProtocol
{
    public var image: URL?
    public var links: [URL] = []
    
    public var description: String = ""
    public var categoryName: String = ""
    public var name: String = "Dumb"
    public var amount: String = ""
    public var typeName: String = ""
    
    public var id: Int = 0
    public var typeId: Int = 0
    public var categoryId: Int = 0
    public var sequenceNumber: Int = 0
    
    public var price: Double = 0
    
}
