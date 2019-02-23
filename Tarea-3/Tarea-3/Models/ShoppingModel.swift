//
//  ShoppingModel.swift
//  Tarea-3
//
//  Created by Gupps on 2/20/19.
//  Copyright © 2019 Gupps. All rights reserved.
//

import Foundation
import RealmSwift

class Shopping: Object {
    @objc dynamic var shoppingName = ""
    @objc dynamic var createAt = Date()
    @objc dynamic var identifier = UUID().uuidString
    
    override static func primaryKey() -> String? {
        return "identifier"
    }
}
