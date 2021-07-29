//
//  Bookworm_2App.swift
//  Bookworm 2
//
//  Created by Olivier Van hamme on 29/07/2021.
//

import SwiftUI

@main
struct Bookworm_2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
