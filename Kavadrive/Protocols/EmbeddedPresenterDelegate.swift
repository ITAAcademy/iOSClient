//
//  EmbeddedPresenterDelegate.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/3/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation


protocol EmbeddedPresenterDelegate {
    func addSpace(for presenter: EmbeddedPresenterProtocol)
    func shrink(presenter: EmbeddedPresenterProtocol)
}
