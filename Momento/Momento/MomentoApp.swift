//
//  MomentoApp.swift
//  Momento
//
//  Created by Nivedha Rajendran on 08.11.24.
//

import SwiftUI

@main
struct MomentoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(careTaker: CareTaker(originator: Originator(text: ""), text: ""))
        }
    }
}
