//
//  categoryViewController.swift
//  Todoey
//
//  Created by abdelkahar mostafa on 2/26/19.
//  Copyright © 2019 abdelkahar mostafa. All rights reserved.
//

import UIKit
import CoreData

class categoryViewController: UITableViewController {
    
    var categoryArray = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    //MARK: - tableview data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCatagoryCell", for: indexPath)
        let category = categoryArray[indexPath.row]

       cell.textLabel?.text = category.name
       
        return cell
        
    }
    
    //MARK: - delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showItems", sender: self)
        //saveItems()
        //tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default, handler: { (action) in
            
            let newItem = Category(context: self.context)
            
            newItem.name = textField.text!
            
            self.categoryArray.append(newItem)
            
            self.saveItems()
        })
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat New item"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func saveItems () {
        do{
            try context.save()
        } catch {
            print(error)
        }
        self.tableView.reloadData()
    }
    
    func loadItems(with request:NSFetchRequest<Category> = Category.fetchRequest()) {
        do{
           
            categoryArray = try context.fetch(request)
        } catch {
            print(error)
        }
    }
    
}
