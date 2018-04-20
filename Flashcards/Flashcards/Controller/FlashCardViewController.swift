//
//  FlashCardViewController.swift
//  Flashcards
//
//  Created by Sight Syndicate on 4/19/18.
//  Copyright © 2018 Carly Chase. All rights reserved.
//

import UIKit

class FlashCardViewController: UITableViewController {
    
    var flashcardArray = [Flashcard]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Flashcard.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFlashcard()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flashcardArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlashcardListCell", for: indexPath)
        
        let flashcard = flashcardArray[indexPath.row]
        
        cell.textLabel?.text = flashcard.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var flashcardTitle = UITextField()
        var flashcardQuestion = UITextField()
        var flashcardAnswer = UITextField()
        
        let alert = UIAlertController(title: "Add a New Flash Card", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Flash Card", style: .default) { (action) in
            
            let new = Flashcard()
            new.title = flashcardTitle.text!
            new.question = flashcardQuestion.text!
            new.answer = flashcardAnswer.text!
            
            self.flashcardArray.append(new)
            
            self.saveFlashcard()
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Flash Card Title"
            flashcardTitle = textField
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Flash Card Question"
            flashcardQuestion = textField
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Answer"
            flashcardAnswer = textField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveFlashcard() {
        // persistent data
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(self.flashcardArray)
            try data.write(to: self.dataFilePath!)
        } catch {
            print("Error encoding new item array, \(error)")
        }
        
        // Reload Table Data
        self.tableView.reloadData()
    }
    
    func loadFlashcard() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                flashcardArray = try decoder.decode([Flashcard].self, from: data)
            } catch {
                print("Error decoding item array \(error)")
            }
        }
    }
}
