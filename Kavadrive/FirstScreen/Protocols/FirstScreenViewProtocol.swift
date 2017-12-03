//
//  FirstScreenViewProtocol.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/3/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import UIKit

protocol FirstScreenViewProtocol: class {
    var presenter: FirstScreenPresenterProtocol! { get set }
    
    
    func showUpper(controller: UIViewController)
    func showBottom(controller: UIViewController)
    var isUpperHidden: Bool { get set }
}
