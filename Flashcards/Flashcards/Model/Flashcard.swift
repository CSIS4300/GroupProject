//
//  Flashcard.swift
//  Flashcards
//
//  Created by Zach Christensen on 2/22/18.
//

import Foundation

class Flashcard {
    
    let answer : String
    let collection : Collection
    let question : String
    
    init(question: String, answer: String, collection: Collection) {
        self.question = question
        self.answer = answer
        self.collection = collection
    }
}
