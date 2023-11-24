//
//  ConnectPetApp.swift
//  ConnectPet
//
//  Created by Foundastion03 on 16/11/23.
//

import SwiftUI

@main
struct ConnectPetApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
