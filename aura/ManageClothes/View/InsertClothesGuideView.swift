//
//  TakePhotoGuideView.swift
//  aura
//
//  Created by Natasha Radika on 22/01/25.
//

import SwiftUI

struct InsertClothesGuideView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Insert a clothes")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 40)
            
            VStack(alignment: .leading, spacing: 16) {
                Text("How do you want to add your clothes?")
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "camera.fill")
                    Text("Take Photo: snap a picture for automatic details.")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                }
                
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "square.and.pencil")
                    Text("Fill In Manually: enter details yourself.")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(.top, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            VStack(spacing: 16) {
                NavigationLink(destination: ClothesDetailView(isNext: true)) {
                    ButtonViewComponent(title: "Take Photo", isPrimary: true)
                }
                
                NavigationLink(destination: ClothesDetailView(isNext: true)) {
                    ButtonViewComponent(title: "Fill in Manually", isPrimary: false)
                }
            }
            
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    InsertClothesGuideView()
}
