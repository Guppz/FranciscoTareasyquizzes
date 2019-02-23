//
//  CatTableViewCell.swift
//  Quiz-2
//
//  Created by Estudiantes on 2/23/19.
//  Copyright © 2019 Gupps. All rights reserved.
//

import UIKit

class CatTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(cat: Cat) {
        nameLabel.text = cat.catName
        colorLabel.text = cat.catColor
        orderLabel.text = String(cat.num)
    }

    
}
