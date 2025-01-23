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
            VStack(alignment: .center, spacing: 20) {
                Text("Manage your clothes")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                Spacer().frame(height: 20)
                
                NavigationLink(destination: TakePhotoGuideView()) {
                    SelectorViewComponent(icon: "plus.app", title: "Add new clothes")
                }
                
                NavigationLink(destination: ClothesListView()) {
                    SelectorViewComponent(icon: "tshirt", title: "View/edit all clothes")
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ManageClothesMenuView()
}
