//
//  CardModel.swift
//  Proyecto-prototipo
//
//  Created by Gupps on 3/17/19.
//  Copyright © 2019 Gupps. All rights reserved.
//

import Foundation

class CardModel {
    var url = "";
    var id = 0;
    var isFlipped = false;
    var isMatched = false;
    
    
    init(dictionary: [String: Any]) {
        self.url = dictionary[APIKeys.Meme.imageURL] as? String ?? ""
        self.id = dictionary[APIKeys.Meme.imageID] as? Int ?? -1
        self.isFlipped = false;
        self.isMatched = false;
    }
    
    init() {
    }
}
