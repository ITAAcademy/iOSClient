//
//  ProductListDataSource.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import UIKit

protocol ProductListDataSourceProtocol: BaseTableDataSourceProtocol {
    
    init(eventHandler: ProductItemCellEventHandlerProtocol)
    
}

