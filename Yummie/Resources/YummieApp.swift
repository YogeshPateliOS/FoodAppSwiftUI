//
//  YummieApp.swift
//  Yummie
//
//  Created by Yogesh Patel on 26/05/23.
//

import SwiftUI

@main
struct YummieApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            OnboardScreenView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
