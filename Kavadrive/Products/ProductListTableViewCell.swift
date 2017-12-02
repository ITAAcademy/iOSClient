//
//  ProductListTableViewCell.swift
//  Kavadrive
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    static var CellIdentifier: String
    {
        return String(describing: type(of: self))
    }
    
    static var NibCell: UINib
    {
        return UINib(nibName: ProductListTableViewCell.CellIdentifier, bundle: nil)
    }
}


extension ProductListTableViewCell
{
    func configure(item: ProductListItemProtocol)
    {
        
    }
}
