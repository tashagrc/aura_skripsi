//
//  auraApp.swift
//  aura
//
//  Created by Natasha Radika on 17/01/25.
//

import SwiftUI
import SwiftData

@main
struct auraApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ClothesModel.self)
        }
    }
}
