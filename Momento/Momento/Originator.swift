//
//  Originator.swift
//  Momento
//
//  Created by Nivedha Rajendran on 08.11.24.
//
import Combine

/// The Originator holds some important state that may change over time. It also
/// defines a method for saving the state inside a memento and another method
/// for restoring the state from it.
///
class Originator {
    
    @Published private(set) var momentos: [Momento] = []
    
    @Published var text: String
    
    init(text: String) {
        self.text = text
    }
    
    /// Saves the current state inside a memento.
    func save(text: String) -> Momento {
        
        let tempMomento = ConcreteMomento(text: text)
        
        momentos.append(tempMomento)
        return tempMomento
    }
    
    func resetState() {
        momentos = []
    }
    
    func restore(momentoStack: Momento) {
        guard let tempMomento = momentoStack as? ConcreteMomento else { return }
        
        text = tempMomento.text
    }
}
