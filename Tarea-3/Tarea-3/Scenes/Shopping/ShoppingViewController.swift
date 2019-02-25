//
//  ViewController.swift
//  Tarea-3
//
//  Created by Gupps on 2/19/19.
//  Copyright © 2019 Gupps. All rights reserved.
//

import UIKit
import RealmSwift

class ShoppingViewController: UIViewController {
    
    private let customCellIdentifier = "ShoppingTableViewCell"
    @IBOutlet weak var tableView: UITableView!
    private var shoppingList: Results<Shopping>?
    private let customCellHeight: CGFloat = 83.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCell()
        addRightNavigationBarButtonItem()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        loadShoppingList();
    }
    
    private func addRightNavigationBarButtonItem(){
        let backButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem(sender:)))
        navigationItem.rightBarButtonItem = backButton
    }
    
    @objc private func addItem(sender: UIBarButtonItem){
        let ac = UIAlertController(title: "Shopping", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0].text
            let shop = Shopping.init(value:["shoppingName":answer])
            self.saveRealmObject(realmObject: shop)
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    private func saveRealmObject(realmObject: Object) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(realmObject, update: true)
                loadShoppingList()
            }
        } catch let error as NSError {
            print("Error found trying to insert or update a category \(error)")
        }
    }
    
    private func deleteRealmObject(realmObject: Object) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(realmObject)
                loadShoppingList()
            }
        } catch let error as NSError {
            print("Error found trying to insert or update a category \(error)")
        }
    }
    

    private func loadShoppingList() {
        do {
            let realm = try Realm()
            var shoppingList = realm.objects(Shopping.self)
            shoppingList = shoppingList.sorted(byKeyPath: "createAt",ascending: false)
            self.shoppingList = shoppingList
            tableView.reloadData()
        } catch let error as NSError {
            print("Error found trying to insert or update a posture Change: \(error)")
        }
    }
    
    
}

extension ShoppingViewController: UITableViewDelegate, UITableViewDataSource {
    private func registerCustomCell() {
        let nib = UINib(nibName: customCellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: customCellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList?.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return customCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier) as? ShoppingTableViewCell else {
            return UITableViewCell()
        }
        if let shoppings = shoppingList {
            cell.setupCell(shopping: shoppings[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            deleteRealmObject(realmObject: (shoppingList?[indexPath.row])!)
            loadShoppingList()
        }
    }
}

