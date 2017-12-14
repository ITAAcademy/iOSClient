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
    
    var id: Int { get set }
    var name: String { get set }
    var openingTime: String { get set }
    var closingTime: String { get set }
    var latitude: Double { get set }
    var longitude: Double { get set }
    var cityName: String { get set }
    var adress: String { get set }
    var links: [URL] { get set }
}

public struct DumbStore: StoreProtocol
{
    public var id: Int = 0
    
    public var name: String = "DumbStore"
    public var openingTime: String = ""
    public var closingTime: String = ""
    public var cityName: String = ""
    public var adress: String = ""
    
    public var latitude: Double = 0
    public var longitude: Double = 0

    public var links: [URL] = []
    
}
