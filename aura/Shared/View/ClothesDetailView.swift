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
        ("Occasion", "Casual"),
        ("Description", "test")
    ]
    
    let columns = [
        GridItem(.fixed(100), alignment: .leading),
        GridItem(.flexible(), alignment: .leading),
        GridItem(.fixed(100), alignment: .leading),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Red T-shirt")
                .font(.title)
                .multilineTextAlignment(.leading)
                .fontWeight(.bold)
                .padding(.top, 40)
                .padding(.horizontal, 20)
            
            Spacer().frame(height: 20)
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(data, id: \.0) { key, value in
                    Text(key)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text(value)
                        .font(.body)
                    
                    Text("Edit")
                        .font(.body)
                }
            }
            .padding()
            
            Spacer()
            
            if isNext {
                NavigationLink(destination: RegisterRFIDTagView()) {
                    ButtonViewComponent(title: "Continue", isPrimary: true)
                }
                
            }
            
        }
        .padding()
        
    }
}

#Preview {
    ClothesDetailView()
}
