//
//  ArrayBasedDataSourceTemplate.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation
import UIKit

class ArrayBasedDataSourceTemplate<C: BaseTableViewCellProtocol, P>: ArrayBasedDataSourceProtocol
{
    typealias T = P
    
    private var array: [P] = []
    
    func updateWith(array: [P]) {
        self.array = array
    }
    
    func cell(for tableView: UITableView, at: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: C.CellIdentifier) ?? UITableViewCell()
    }
    
    var count: Int {
        return array.count
    }
    
    func registerCells(for tableView: UITableView) {
        tableView.register(C.NibCell, forCellReuseIdentifier: C.CellIdentifier)
    }
    
    
    
}
