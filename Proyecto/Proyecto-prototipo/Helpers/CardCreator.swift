//
//  CardCreator.swift
//  Proyecto-prototipo
//
//  Created by Gupps on 3/22/19.
//  Copyright © 2019 Gupps. All rights reserved.
//

import Foundation
import Kingfisher

class CardCrator{
    
    
    func getCardsMemori() -> [CardModel] {
        var randomNumberGen = [Int]()
        var cardArray = [CardModel]()
        while randomNumberGen.count < 8{
            let randomNumber = arc4random_uniform(13)+1
            if(randomNumberGen.contains(Int(randomNumber)) == false){
                let cardOne = CardModel()
                cardOne.url = "card\(randomNumber)"
                cardArray.append(cardOne)
                let cardTwo = CardModel()
                cardTwo.url = "card\(randomNumber)"
                cardArray.append(cardTwo)
                randomNumberGen.append(Int(randomNumber))
                
            }
            let randomNum = arc4random_uniform(UInt32(cardArray.count))
            let temporary = cardArray[0]
            cardArray[0] = cardArray[Int(randomNum)]
            cardArray[Int(randomNum)] = temporary
        }
        return cardArray
    }
    
    
    
    func getCardsApi(cards:[CardModel]) -> [CardModel] {
        var randomNumberGen = [Int]()
        var cardArray = [CardModel]()
        var randomArray = [CardModel]()
        while randomNumberGen.count < 8{
            let randomNumber = arc4random_uniform(13)+1
            if(randomNumberGen.contains(Int(randomNumber)) == false){
                let cardOne = CardModel()
                cardOne.url = cards[Int(randomNumber)].url
                cardArray.append(cardOne)
                let cardTwo = CardModel()
                cardTwo.url = cards[Int(randomNumber)].url
                cardArray.append(cardTwo)
                randomNumberGen.append(Int(randomNumber))
            }
            randomArray = cardArray.shuffled()
        }
        return randomArray
    }
}
