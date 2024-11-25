//
//  TheSimpleCloud2App.swift
//  TheSimpleCloud2
//
//  Created by Roman Maiboroda on 24/11/2024.
//

import SwiftUI

@main
struct TheSimpleCloud2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
