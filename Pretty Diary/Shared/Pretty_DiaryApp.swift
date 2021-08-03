//
//  Pretty_DiaryApp.swift
//  Shared
//
//  Created by Kamil Grzeczkowski on 03/08/2021.
//

import SwiftUI

@main
struct Pretty_DiaryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
