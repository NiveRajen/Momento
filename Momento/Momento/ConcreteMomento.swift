//
//  Momento.swift
//  Momento
//
//  Created by Nivedha Rajendran on 08.11.24.
//


//Snapshot - value type
struct ConcreteMomento: Momento {
    
    private(set) var text: String
        
    init(text: String) {
        self.text = text
    }
    
}
