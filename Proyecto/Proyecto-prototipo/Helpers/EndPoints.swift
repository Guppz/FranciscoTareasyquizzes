//
//  EndPoints.swift
//  Proyecto-prototipo
//
//  Created by Gupps on 3/22/19.
//  Copyright © 2019 Gupps. All rights reserved.
//

import Foundation

struct API {
    static let baseURL = "http://version1.api.memegenerator.net//Generators_Search?1="
    static let pageIndex = "&pageIndex=0&pageSize=20&apiKey=demo"
}

struct EndPoints {
    static func getMemesURL() -> String {
        return "\(API.baseURL)pepe\(API.pageIndex)"
    }
}
