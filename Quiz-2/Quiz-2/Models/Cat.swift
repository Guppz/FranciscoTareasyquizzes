//
//  Cat.swift
//  Quiz-2
//
//  Created by Estudiantes on 2/23/19.
//  Copyright © 2019 Gupps. All rights reserved.
//

import Foundation
import RealmSwift



class Cat: Object {
    @objc dynamic var catName = ""
    @objc dynamic var num = 0
    @objc dynamic var catColor = ""
    @objc dynamic var identifier = UUID().uuidString
    override static func primaryKey() -> String? {
        return "identifier"
    }
}
