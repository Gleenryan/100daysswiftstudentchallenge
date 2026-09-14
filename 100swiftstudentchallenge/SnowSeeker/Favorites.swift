//
//  Favorites.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 14/09/26.
//

import SwiftUI

@Observable
class Favorites{
    private var resorts: Set<String>
    //set biar ga ada duplikat
    private let key = "Favorites"
    
    init(){
        resorts = []
    }
    
    //if already have the resort return true
    func contains(_ resort: Resort) -> Bool{
        resorts.contains(resort.id)
    }
    
    // adds the resort to our set and saves the change
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }

    // removes the resort from our set and saves the change
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }

    func save() {
        // write out our data
    }
    
    
}


