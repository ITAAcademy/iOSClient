//
//  Location.swift
//  iOSKavadriveSDK
//
//  Created by Nikolas Omelianov on 17.12.17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation

public protocol LocationsProtocol
{
    var latitude: Double { get set }
    var longitude: Double { get set }
    var name: String { get set }
    var distance: Float { get set }
}

public struct Locations : LocationsProtocol
{
    
    var latitude: Double = 0
    var longitude: Double = 0
    
    var name: String = ""
    
    var distance: Float = 0
}
