//
//  categoryViewController.swift
//  Todoey
//
//  Created by abdelkahar mostafa on 2/26/19.
//  Copyright © 2019 abdelkahar mostafa. All rights reserved.
//

import UIKit
import RealmSwift

class categoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var categoryArray: Results<Category>?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray?.count ?? 1
    }
    
    //MARK: - tableview data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCatagoryCell", for: indexPath)

       cell.textLabel?.text = categoryArray?[indexPath.row].name ?? "no categories"
       
        return cell
        
    }
    
    //MARK: - delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showItems", sender: self)
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray?[indexPath.row]
        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default, handler: { (action) in
            
            let newItem = Category()
            
            newItem.name = textField.text!
           
            self.save(category: newItem)
        })
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat New item"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func save(category: Category) {
        do{
            try realm.write {
                realm.add(category)
            }
            
        } catch {
            print(error)
        }
       tableView.reloadData()
    }
    
    func loadItems() {
        categoryArray = realm.objects(Category.self)
        tableView.reloadData()
    }
    
}
