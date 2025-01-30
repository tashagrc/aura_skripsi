//
//  ManageClothesMenuView.swift
//  aura
//
//  Created by Natasha Radika on 17/01/25.
//

import SwiftUI

struct ManageClothesMenuView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("Manage your clothes")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 40)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .accessibilityAddTraits(.isHeader) // Marked as a header
                
                NavigationLink(destination: InsertClothesGuideView()) {
                    SelectorViewComponent(icon: "plus.app", title: "Add new clothes")
                }
                .accessibilityLabel("Add new clothes to your collection")
                .accessibilityHint("Navigate to add clothes by taking a photo or filling in details manually.")

                NavigationLink(destination: ClothesListView()) {
                    SelectorViewComponent(icon: "tshirt", title: "View/edit all clothes")
                }
                .accessibilityLabel("View or edit all saved clothes")
                .accessibilityHint("Navigate to see and manage all added clothes.")
                
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    ManageClothesMenuView()
}
