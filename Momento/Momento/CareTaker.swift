//
//  CareTaker.swift
//  Momento
//
//  Created by Nivedha Rajendran on 08.11.24.
//

import Combine
/// The Caretaker doesn't depend on the Concrete Memento class. Therefore, it
/// doesn't have access to the originator's state, stored inside the memento. It
/// works with all mementos via the base Memento interface.
class CareTaker: ObservableObject {
    
    @Published private(set) var momentos: [Momento] = []
    
    @Published var text: String
    
    private var momentoStack = [ConcreteMomento]()
    
    private let originator: Originator
    
    private var cancellable: Set<AnyCancellable> = []
    
    
    init(originator: Originator, text: String) {
        self.originator = originator
        self.text = text

        originator.$text
            .map { $0 }
            .assign(to: &$text)
    }
    
    func save() {
        momentos.append(originator.save(text: text))
    }
    
    func undo() {
        guard !momentos.isEmpty else { return }
        
        momentos.removeLast()
        
        guard let momentoStack = momentos.last else {
            originator.resetState()
            return
        }
        
        originator.restore(momentoStack: momentoStack)
    }
}
