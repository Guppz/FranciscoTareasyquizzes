//
//  ShoppingTableViewCell.swift
//  Tarea-3
//
//  Created by Gupps on 2/20/19.
//  Copyright © 2019 Gupps. All rights reserved.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shoppingLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func setupCell(shopping: Shopping) {
        shoppingLabel.text = shopping.shoppingName
        dateLabel.text = shopping.createAt.getFormatted(dateStyle: .medium, timeStyle: .short)
    }
    
    
}
