//
//  Categories.swift
//  Clase-4
//
//  Created by Gupps on 2/17/19.
//  Copyright © 2019 Gupps. All rights reserved.
//

import Foundation

struct Category {
    var name: String
    var image: String
    var news: [News]
    let identifier = UUID().uuidString
}
