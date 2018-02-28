//
//  ViewController.swift
//  Flashcards
//
//

import UIKit

class CollectionViewController: UITableViewController {
    
//    var collectionArray = [Collection]()
    var collectionArray = ["Econ", "Math", "Finance"]
    let defaults = UserDefaults.standard
 
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionArray.append(Collection(name: "Econ"))
//        collectionArray.append(Collection(name: "Math"))
//        collectionArray.append(Collection(name: "Finance"))
        if let collection = defaults.array(forKey: "CollectionListArray") as? [String] {
            collectionArray = collection
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectionArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionListCell", for: indexPath)
        
//        cell.textLabel?.text = collectionArray[indexPath.row].collectionName
        cell.textLabel?.text = collectionArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var newCollection = UITextField()
        let alert = UIAlertController(title: "Add a New Collection", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Collection", style: .default) { (action) in
//            self.collectionArray.append(Collection(name: newCollection.text!))
            self.collectionArray.append(newCollection.text!)

            // TODO: Add error handling
            
            // save user input
            self.defaults.set(self.collectionArray, forKey: "CollectionListArray")
            // Reload Table data
            self.tableView.reloadData()
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Collection Name"
            newCollection = textField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

