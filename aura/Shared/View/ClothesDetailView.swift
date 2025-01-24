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
        GridItem(.fixed(100), alignment: .leading),
        GridItem(.fixed(100), alignment: .leading),
    ]
    
    @State private var selection = "T-Shirt"
    let colors = ["T-Shirt", "Green", "Blue", "Black", "Tartan"]
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image("clothes_sample")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(12)
                .padding(.horizontal, 20)
                
            
            Text("Red T-shirt")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal, 20)
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(data, id: \.0) { key, value in
                    Text(key)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Picker("Select a paint color", selection: $selection) {
                        ForEach(colors, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            .padding(.horizontal, 20)
           
            
            Spacer()
            
            if isNext {
                NavigationLink(destination: RegisterRFIDTagView()) {
                    ButtonViewComponent(title: "Continue", isPrimary: true)
                }
                
            }
            
        }
        .padding(.top, 40)
        
    }
}

#Preview {
    ClothesDetailView()
}
