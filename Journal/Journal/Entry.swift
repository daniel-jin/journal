//
//  Entry.swift
//  Journal
//
//  Created by Daniel Jin on 12/26/17.
//  Copyright © 2017 Daniel Jin. All rights reserved.
//

import Foundation

class Entry: Equatable, Codable {
    
    // MARK: - Properties
    
    var timestamp: Date
    var title: String
    var text: String
    
    // Memberwise Initializer
    
    init(timestamp: Date = Date(), title: String, text: String) {
        
        self.timestamp = timestamp
        self.title = title
        self.text = text
        
    }
    
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    
    return lhs.timestamp == rhs.timestamp && lhs.title == rhs.title && lhs.text == rhs.text
    
}

