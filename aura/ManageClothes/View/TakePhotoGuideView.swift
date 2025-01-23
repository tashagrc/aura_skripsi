//
//  TakePhotoGuideView.swift
//  aura
//
//  Created by Natasha Radika on 22/01/25.
//

import SwiftUI

struct TakePhotoGuideView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Insert a clothes")
                .font(.title)
                .multilineTextAlignment(.leading)
                .fontWeight(.bold)
                .padding(.top, 40)
            Text("How do you want to add your clothes?\n- Take Photo: snap a picture for automatic details.\n- Fill In Manually: enter details yourself.")
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding(.top, 40)
            
            Spacer()
            
            NavigationLink(destination: ClothesDetailView(isNext: true)) {
                ButtonViewComponent(title: "Take Photo", isPrimary: true)
            }
            
            NavigationLink(destination: ClothesDetailView(isNext: true)) {
                ButtonViewComponent(title: "Fill in Manually", isPrimary: false)
            }
        }
        .padding()
    }
}

#Preview {
    TakePhotoGuideView()
}
