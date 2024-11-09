//
//  ContentView.swift
//  Momento
//
//  Created by Nivedha Rajendran on 08.11.24.
//

import SwiftUI


struct ContentView: View {
        
    @StateObject private var careTaker: CareTaker
        
    init(careTaker: CareTaker) {
        _careTaker = StateObject(wrappedValue: careTaker)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            
            Text("Enter your experience here:")
            
            TextEditor(text: $careTaker.text)
                .cornerRadius(10)
                .padding(.horizontal)
            
            HStack() {
                Button("Save") {
                    careTaker.save()
                }
                .frame(maxWidth: .infinity)
                
                Button("Undo") {
                    careTaker.undo()
                }
                .frame(maxWidth: .infinity)
            }
            
        }
        .padding()
        .background(.red.opacity(0.2))
        
        
    }
}

#Preview {
    let text = ""
    ContentView(careTaker: CareTaker(originator: Originator(text: text), text: text))
}
