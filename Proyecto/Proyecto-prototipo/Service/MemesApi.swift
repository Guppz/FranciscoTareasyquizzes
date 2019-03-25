//
//  MemesApi.swift
//  Proyecto-prototipo
//
//  Created by Gupps on 3/22/19.
//  Copyright © 2019 Gupps. All rights reserved.
//

import Foundation
import Alamofire

class MemesAPI{
    
    
    func fetchMemes(completionHandler: @escaping ([CardModel]?, ServiceError?) -> Void) {
        guard let isNetworkReachable = NetworkReachabilityManager()?.isReachable else {
            completionHandler(nil,ServiceError.unknown)
            return
        }
        if !isNetworkReachable {
             makeFetchMemesMemori(completionHandler: completionHandler)
        }
        else {
            makeFetchMemesAPICall(completionHandler: completionHandler)
        }
    }
    
    
    private func makeFetchMemesAPICall(completionHandler: @escaping ([CardModel]?, ServiceError?) -> Void) {
        let requestPath = EndPoints.getMemesURL()
        if let request = AlamoFireHelper.createRequest(parameters: nil, requestPath: requestPath, httpMethod: .get) {
            AF.request(request).responseJSON { (response) in
                if let jsonData = response.result.value as? [String: Any], let memes = jsonData[APIKeys.Main.result] as? [[String: Any]] {
                    completionHandler(memes.map({CardModel.init(dictionary: $0)}), nil)
                }
                else {
                    completionHandler(nil,ServiceError.wrongAnswer)
                }
            }
        } else {
            completionHandler(nil,ServiceError.badURL)
        }
    }
    private func makeFetchMemesMemori(completionHandler: @escaping ([CardModel]?, ServiceError?) -> Void) {
            let cardCreator = CardCrator()
            let cards = cardCreator.getCardsMemori()
            completionHandler([cards[0],cards[1],cards[2],cards[3],
                               cards[4],cards[5],cards[6],cards[7],
                               cards[8],cards[9],cards[10],cards[11],
                               cards[12],cards[13],cards[14],cards[15]],ServiceError.internet)
        }
}
