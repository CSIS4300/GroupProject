//
//  ViewController.swift
//  Flashcards
//
//

import UIKit

class CollectionViewController: UITableViewController {
    
    var collectionArray = [Collection]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Collections.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCollection()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectionArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionListCell", for: indexPath)
        
        let collection = collectionArray[indexPath.row]
        
        cell.textLabel?.text = collection.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var newCollection = UITextField()
        
        let alert = UIAlertController(title: "Add a New Collection", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Collection", style: .default) { (action) in
            
            let new = Collection()
            new.name = newCollection.text!
            
            self.collectionArray.append(new)
            
            self.saveCollection()
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Collection Name"
            newCollection = textField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveCollection() {
        // persistent data
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(collectionArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding new item array, \(error)")
        }
        
        // Reload Table Data
        self.tableView.reloadData()
    }
    
    func loadCollection() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                collectionArray = try decoder.decode([Collection].self, from: data)
            } catch {
                print("Error decoding item array \(error)")
            }
        }
    }
}

