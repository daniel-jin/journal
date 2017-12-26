//
//  EntryController.swift
//  Journal
//
//  Created by Daniel Jin on 12/26/17.
//  Copyright © 2017 Daniel Jin. All rights reserved.
//

import Foundation

class EntryController {
    
    static let shared = EntryController()
    
    var entries: [Entry] = []
    
    // MARK: - CRUD Functions
    
    func addEntryWith(title: String, text: String) {
        
        // Create entry with the data, then add to the array
        let entry = Entry(title: title, text: text)
        entries.append(entry)
        
    }
    
    func remove(entry: Entry) {
        
        guard let index = entries.index(of: entry) else { return }
        
        entries.remove(at: index)
        
    }
    
    func update(entry: Entry, title: String, text: String) {
        
        entry.title = title
        entry.text = text
        
    }
    
}
