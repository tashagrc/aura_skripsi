//
//  TakePhotoGuideView.swift
//  aura
//
//  Created by Natasha Radika on 22/01/25.
//

import SwiftUI

struct InsertClothesGuideView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Insert a clothes")
                .font(.title)
                .multilineTextAlignment(.leading)
                .fontWeight(.bold)
                .padding(.top, 40)
            VStack(alignment: .leading, spacing: 10) {
                Text("How do you want to add your clothes?")
                    .font(.headline)
                    .padding(.bottom, 10)

                HStack(alignment: .top) {
                    Image(systemName: "camera.fill")
                    Text("Take Photo: snap a picture for automatic details.")
                }

                HStack(alignment: .top) {
                    Image(systemName: "square.and.pencil")
                    Text("Fill In Manually: enter details yourself.")
                }
            }
            .padding(.top, 40)
            
            Spacer()
            
            NavigationLink(destination: ClothesDetailView(isNext: true)) {
                ButtonViewComponent(title: "Take Photo", isPrimary: true)
            }
            
            NavigationLink(destination: ClothesDetailView(isNext: true)) {
                ButtonViewComponent(title: "Fill in Manually", isPrimary: false)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(50)
    }
}

#Preview {
    InsertClothesGuideView()
}
