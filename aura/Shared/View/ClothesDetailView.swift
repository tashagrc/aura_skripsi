//
//  ClothesDetailView.swift
//  aura
//
//  Created by Natasha Radika on 22/01/25.
//

import SwiftUI

struct ClothesDetailView: View {
    var isNext: Bool = false
    
    let data = [
        ("Type", "T-shirt"),
        ("Category", "Top"),
        ("Color", "Yellow"),
        ("Pattern", "Polka dot"),
        ("Occasion", "Casual")
    ]
    
    let columns = [
        GridItem(.fixed(120), alignment: .leading),
        GridItem(.flexible(), alignment: .leading),
    ]
    
    @State private var selection = "T-Shirt"
    let colors = ["T-Shirt", "Green", "Blue", "Black", "Tartan"]
    
    var body: some View {
        VStack(spacing: 24) {
            Image("clothes_sample")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(12)
                
            
            Text("Red T-shirt")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(data, id: \.0) { key, value in
                    Text(key)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Picker("Select a paint color", selection: $selection) {
                        ForEach(colors, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
            }
            .padding(.horizontal, 16)
           
            
            Spacer()
            
            if isNext {
                NavigationLink(destination: RegisterRFIDTagView()) {
                    ButtonViewComponent(title: "Continue", isPrimary: true)
                }
                
            }
            
        }
        .padding(.horizontal, 16)
        
    }
}

#Preview {
    ClothesDetailView()
}
