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
            VStack(alignment: .leading, spacing: 20) {
                Text("Where do you want to go?")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                Spacer().frame(height: 20)
                
                SelectorViewComponent(icon: "plus.app", title: "Add new clothes", destination: TakePhotoGuideView())
                SelectorViewComponent(icon: "tshirt", title: "View/edit all clothes", destination: ClothesListView())
                Spacer()
            }
            .padding()
        }
        
    }
}

#Preview {
    ManageClothesMenuView()
}
