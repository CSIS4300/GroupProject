//
//  CollectionBank.swift
//  Flashcards
//
//  Created by Sight Syndicate on 2/23/18.
//  Copyright © 2018 Carly Chase. All rights reserved.
//

import Foundation

class CollectionBank {
    
    var list = [Collection]()
    
    init() {
        // Add items to flash cards ## For Temp use ##
        
        list.append(Collection(name: "Econ"))
        list.append(Collection(name: "Math"))
        list.append(Collection(name: "Finance"))
        
    }
}
