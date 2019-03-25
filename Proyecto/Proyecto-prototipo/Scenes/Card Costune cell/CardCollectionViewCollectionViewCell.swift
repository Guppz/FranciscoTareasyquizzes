//
//  CardCollectionViewCollectionViewCell.swift
//  Proyecto-prototipo
//
//  Created by Gupps on 3/17/19.
//  Copyright © 2019 Gupps. All rights reserved.
//

import UIKit
import Kingfisher

class CardCollectionViewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var frontImage: UIImageView!
    
    func setupCell(carsdModal: CardModel) {
        if(carsdModal.isFlipped || carsdModal.isMatched){
            self.flip()
        }else{
            self.flipBack()
        }
        frontImage.image = UIImage(named: carsdModal.url)
    }
    
    func setupCellKing(carsdModal: CardModel){
        let url = URL(string: carsdModal.url)
        if(carsdModal.isFlipped || carsdModal.isMatched){
            self.flip()
        }else{
            self.flipBack()
        }
        frontImage.kf.setImage(with: url)
    }
    
    func flip(){
        UIView.transition(from: backImage, to: frontImage, duration: 0.3, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
    }
    
    func flipBack(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.5) {
              UIView.transition(from: self.frontImage, to: self.backImage, duration: 0.3, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
        }
    }
    
    func removeCell(){
        backImage.alpha = 0
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontImage.alpha = 0
        }, completion: nil)
    }
    
}
