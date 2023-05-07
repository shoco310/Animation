//
//  SwiftUI_AnimationApp.swift
//  SwiftUI-Animation
//
//  Created by satoshoco on 2023/05/07.
//

import SwiftUI

@main
struct SwiftUI_AnimationApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
