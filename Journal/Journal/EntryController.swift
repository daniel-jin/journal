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
    
    init() {
        loadFromPersistantStorage()
    }
    
    // MARK: - CRUD Functions
    
    func addEntryWith(title: String, text: String) {
        
        // Create entry with the data, then add to the array
        let entry = Entry(title: title, text: text)
        entries.append(entry)
        
        saveToPersistantStorage()
        
    }
    
    func remove(entry: Entry) {
        
        guard let index = entries.index(of: entry) else { return }
        
        entries.remove(at: index)
        
        saveToPersistantStorage()
        
    }
    
    func update(entry: Entry, title: String, text: String) {
        
        entry.title = title
        entry.text = text
        
        saveToPersistantStorage()
        
    }
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "journal.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    func saveToPersistantStorage() {
        
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(entries)
            try data.write(to: fileURL())
        } catch let error {
            NSLog("Error saving to persistant storage. \(error)")
        }
    }
    
    func loadFromPersistantStorage() {
        
        let decoder = JSONDecoder()
        
        do {
            let data = try Data(contentsOf: fileURL())
            let entries = try decoder.decode([Entry].self, from: data)
            self.entries = entries
        } catch let error {
            NSLog("Error loading from persistant storage. \(error)")
        }
        
    }
    
}
