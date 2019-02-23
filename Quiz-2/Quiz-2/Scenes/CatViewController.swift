//
//  ViewController.swift
//  Quiz-2
//
//  Created by Gupps on 2/22/19.
//  Copyright © 2019 Gupps. All rights reserved.
//

import UIKit
import RealmSwift

class CatViewController: UIViewController {
    
    private let customCellIdentifier = "CatTableViewCell"
    private var CatList: Results<Cat>?
    @IBOutlet weak var tableView: UITableView!
    private let customCellHeight: CGFloat = 80.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCell()
        loadCategories()
    }
    
    private func loadCategories() {
        do {
            let realm = try Realm()
            let CatList = realm.objects(Cat.self)
            if CatList.isEmpty {
                saveCategoriesInRealm()
            }
            else{
                self.CatList = CatList
                tableView.reloadData()
            }
        } catch let error as NSError {
            print("Error found trying to insert or update a posture Change: \(error)")
        }
        
    }
    
    private func saveCategoriesInRealm(){
        let cat1 = Cat.init(value: ["catName": "Fulfy", "num": 1,"catColor":"Blanco"])
        let cat2 = Cat.init(value: ["catName": "Camila", "num": 2,"catColor":"Blanco"])
        let cat3 = Cat.init(value: ["catName": "Gato", "num": 3,"catColor":"Negro"])
        let cat4 = Cat.init(value: ["catName": "Negro", "num": 4,"catColor":"Cafe"])
        let cat5 = Cat.init(value: ["catName": "Aranas", "num": 5,"catColor":"Amarillo"])
        let cat6 = Cat.init(value: ["catName": "Sandy", "num": 6,"catColor":"Cafe"])
        let cat7 = Cat.init(value: ["catName": "Caty Cat", "num": 7,"catColor":"Negro"])
        let cat8 = Cat.init(value: ["catName": "Mr Snow", "num": 8,"catColor":"Blanco"])
        let cat9 = Cat.init(value: ["catName": "Mrs Snow", "num": 9,"catColor":"Blanco"])
        let cat10 = Cat.init(value: ["catName": "Happy", "num": 10,"catColor":"Azul"])
        
        let arrayToInsert = [cat1,cat2,cat3,cat4,cat5,cat6,cat7,cat8,cat9,cat10]
        for cat in arrayToInsert {
            saveRealmObject(realmObject: cat)
        }
        loadCategories()
    }
    
    private func saveRealmObject(realmObject: Object) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(realmObject, update: true)
            }
        } catch let error as NSError {
            print("Error found trying to insert or update a category \(error)")
        }
    }
    
    
}

extension CatViewController: UITableViewDelegate, UITableViewDataSource {
    private func registerCustomCell() {
        let nib = UINib(nibName: customCellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: customCellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CatList?.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return customCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier) as? CatTableViewCell else {
            return UITableViewCell()
        }
        if let cat = CatList {
            cell.setupCell(cat: (CatList?[indexPath.row])!)
        }
        return cell
    }
}


