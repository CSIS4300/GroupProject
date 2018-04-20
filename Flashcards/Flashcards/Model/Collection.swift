//
//  Collection.swift
//  Flashcards
//
//  Created by Sight Syndicate on 2/23/18.
//

import Foundation

class Collection {
    
    var name : String
    var flashcards = [Flashcard]()
    
    init(name: String) {
        self.name = name
        self.flashcards.append(Flashcard(title: "empty", question: "empty", answer: "empty"))
    }
}
