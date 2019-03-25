//
//  ViewController.swift
//  Proyecto-prototipo
//
//  Created by Gupps on 3/3/19.
//  Copyright © 2019 Gupps. All rights reserved.
//

import UIKit
import DeviceKit
import JGProgressHUD

class ViewController: UIViewController {
    
    @IBOutlet weak var colletctuinView: UICollectionView!
    var customCellIdentifier = "CardCollectionViewCollectionViewCell"
    var calulacion:[CGFloat] = []
    var model = CardModel()
    var cardCreator = CardCrator()
    var cardArray:[CardModel]?
    var frist : IndexPath?
    var estimateWidth :CGFloat  = 0
    var cellMargin :CGFloat = 0
    var noInternet = false
    var onRealoading = false
    private let network = MemesAPI()
    let hud = JGProgressHUD(style: .dark)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCards()
        self.registerCustomCell()
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)
        if(noInternet){
            self.showAlert("No Internet!","El juego va comensar de modo offline")
            hud.dismiss()
        }
    }
    
    @IBAction func Restart(_ sender: Any) {
        reloadGame()
    }
    
    
    func reloadGame(){
        self.cardArray = nil;
        fetchCards()
        self.colletctuinView.reloadData()
    }
    
    
    func fetchCards(){
        network.fetchMemes { (cardArrayApi, ServiceError) in
            self.cardArray = cardArrayApi
            if(ServiceError == Proyecto_prototipo.ServiceError.internet){
                self.cardArray = self.cardCreator.getCardsMemori()
                self.noInternet = true
            }else{
                self.cardArray = self.cardCreator.getCardsApi(cards: self.cardArray!)
            }
            if UIApplication.shared.statusBarOrientation.isLandscape {
                self.calulacion = DeviceUtil.deviceLanScape()
            } else {
                self.calulacion = DeviceUtil.devicePortrait()
            }
            self.estimateWidth = self.calulacion[0]
            self.cellMargin = self.calulacion[1]
            self.hud.dismiss()
            self.colletctuinView.reloadData()
        }
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { context in
            if UIApplication.shared.statusBarOrientation.isLandscape {
                self.calulacion = DeviceUtil.deviceLanScape()
                self.onRealoading = true
                self.colletctuinView.reloadData()
            } else {
                self.calulacion = DeviceUtil.devicePortrait()
                self.onRealoading = true
                self.colletctuinView.reloadData()
            }
            self.estimateWidth = self.calulacion[0]
            self.cellMargin = self.calulacion[1]
            self.onRealoading = false
        })
    }
    
    
    
    func showAlert(_ title:String,_ message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reload game", style: .default, handler:{
            
            (UIAlertAction) in
            
            self.reloadGame()
            
            })
        alert.addAction(alertAction)
        present(alert,animated: true,completion: nil)
    }
}





extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func checkGameEnded(){
        var isWon = true
        for card in cardArray!{
            if card.isMatched == false {
                isWon = false
                break
            }
            
        }
        var title="";
        var message="";
        if isWon{
            title="Congratulations"
            message="You won"
            showAlert(title, message)
        }
    }
    private func registerCustomCell() {
        let nib = UINib(nibName: customCellIdentifier, bundle: nil)
        colletctuinView.register(nib, forCellWithReuseIdentifier: customCellIdentifier)    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray?.count ?? 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath) as? CardCollectionViewCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let card = cardArray{
            if noInternet == false{
                cell.setupCellKing(carsdModal: (card[indexPath.row]))
            }else{
                cell.setupCell(carsdModal: (card[indexPath.row]))
                self.hud.dismiss()
            }
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCollectionViewCell
        let card = cardArray?[indexPath.row]
        if card?.isFlipped == false && card?.isMatched==false{
            cell.flip()
            card?.isFlipped = true
            if(frist == nil){
                frist = indexPath
            }else{
                checkForMatches(indexPath)
            }
            
        }
    }
    
    
    func checkForMatches(_ second:IndexPath){
        let card = colletctuinView.cellForItem(at: frist!) as? CardCollectionViewCollectionViewCell
        let cardSecond = colletctuinView.cellForItem(at: second) as? CardCollectionViewCollectionViewCell
        let cardOne = cardArray?[frist!.row]
        let cardTwo = cardArray?[second.row]
        
        //Compare the two cards
        if cardOne?.url == cardTwo?.url{
            cardOne?.isMatched = true
            cardTwo?.isMatched = true
//            card?.removeCell()
//            cardSecond?.removeCell()
            checkGameEnded()
        }else{
            cardOne?.isFlipped = false
            cardTwo?.isFlipped = false
            card?.flipBack();
            cardSecond?.flipBack();
        }
        if card == nil{
            colletctuinView.reloadData()
        }
        frist = nil
    }
    
    
}
extension ViewController:UICollectionViewDelegateFlowLayout{
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = self.calulateWith()
            return CGSize(width: width, height: width)
        }
    
        func calulateWith() -> CGFloat {
            let estimatedWidth = CGFloat(estimateWidth)
            let cellCount = floor(CGFloat(self.view.frame.size.width)/estimatedWidth)
            let margin = CGFloat(cellMargin * 2)
            let width = (self.view.frame.size.width - CGFloat(cellMargin) * (cellCount - 1) - margin)/cellCount
            return width
        }
}

