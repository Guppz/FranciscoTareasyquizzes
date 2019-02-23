//
//  CategoriesTableViewCell.swift
//  Clase-4
//
//  Created by Gupps on 2/17/19.
//  Copyright © 2019 Gupps. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    @IBOutlet weak var imageCategories: UIImageView!
    @IBOutlet weak var labelCategories: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(category: Category) {
        labelCategories.text = category.name
        imageCategories.image = UIImage(named: category.image)
    }
    
    
}
