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
                    .multilineTextAlignment(.leading)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                NavigationLink(destination: InsertClothesGuideView()) {
                    SelectorViewComponent(icon: "plus.app", title: "Add new clothes")
                }
                
                NavigationLink(destination: ClothesListView()) {
                    SelectorViewComponent(icon: "tshirt", title: "View/edit all clothes")
                }
                
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
