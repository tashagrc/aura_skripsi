//
//  ContentView.swift
//  aura
//
//  Created by Natasha Radika on 17/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SelectOccasionView()
                .tabItem {
                    Label("Pick Outfit", systemImage: "hanger")
                }
            
            ManageClothesMenuView()
                .tabItem {
                    Label("Manage Clothes", systemImage: "archivebox")
                }
        }
    }
}

#Preview {
    ContentView()
}
