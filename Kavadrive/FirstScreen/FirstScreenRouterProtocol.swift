//
//  FirstScreenRouterProtocol.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/3/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import UIKit

protocol FirstScreenRouterProtocol: class {
    var presenter: FirstScreenPresenterProtocol! { get set }
    
    func getProductListController(with: [ProductListItemProtocol]) -> UIViewController
}
