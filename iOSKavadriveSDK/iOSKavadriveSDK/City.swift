//
//  City.swift
//  iOSKavadriveSDK
//
//  Created by Nikolas Omelianov on 14.12.17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation


public protocol CityProtocol
{
    var id: Int { get set }
    var name: String { get set }
    var links: [URL] { get set }
}


public struct DumbCity: CityProtocol
{
    public var id: Int = 0
    
    public var name: String = "DumbCity"
    
    public var links: [URL] = []
    
}
