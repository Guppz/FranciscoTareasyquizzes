//
//  NewsTableViewCell.swift
//  Clase-4
//
//  Created by Gupps on 2/17/19.
//  Copyright © 2019 Gupps. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(news: News) {
        titleLabel.text = news.title
        dateLabel.text = news.createAt.getFormatted(dateStyle: .medium, timeStyle: .short)
    }
}
