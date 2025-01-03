//
//  BetSweatApp.swift
//  BetSweat
//
//  Created by Hrishubh Zatakia on 3/1/2025.
//

import SwiftUI

@main
struct BetSweatApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
