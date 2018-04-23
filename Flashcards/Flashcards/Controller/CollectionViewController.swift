//
//  ViewController.swift
//  Collections
//
//

import UIKit

class CollectionViewController: UITableViewController {
    
    var curCollection:Collection = Collection(name: "null from collections")
    var collectionArray = [Collection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        curCollection = collectionArray[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toFlashcards", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let downCast = segue.destination as? FlashcardViewController{
            downCast.lookAtMeJake = curCollection
        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var newCollection = UITextField()
        
        let alert = UIAlertController(title: "Add a New Collection", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Collection", style: .default) { (action) in
            self.collectionArray.append(Collection(name: newCollection.text!))
            self.update()
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Collection Name"
            newCollection = textField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    func update() {
        self.tableView.reloadData()
    }
}

