//
//  FlashCardViewController.swift
//  Flashcards
//
//  Created by Sight Syndicate on 4/19/18.
//
import UIKit

class FlashCardTableViewController: UITableViewController {
    
    var flashcardArray = [Flashcard]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            
        self.flashcardArray.append(Flashcard(title: flashcardTitle.text!, question: flashcardQuestion.text!, answer: flashcardAnswer.text!))
            
        self.update()
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
    
    func update() {
        self.tableView.reloadData()
    }
}
