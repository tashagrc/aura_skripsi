//
//  SelectClothesItemView.swift
//  aura
//
//  Created by Natasha Radika on 21/01/25.
//

import SwiftUI

struct SelectClothesItemView: View {
    
    var cardData = [
        (title: "Card 1", description: "Description of card 1"),
        (title: "Card 2", description: "Description of card 2"),
        (title: "Card 3", description: "Description of card 3")
    ]
    
    var body: some View {
        VStack(spacing: 24) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Select a clothes")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Text("Show clothes that match with XX")
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(cardData, id: \.title) { card in
                        NavigationLink(destination: ClothesSummaryView()) {
                            ClothesCardViewComponent(title: card.title, description: card.description, imagePath: "clothes_sample")
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
                .padding(.top, 16)
                
            }
            
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
    }
}

#Preview {
    SelectClothesItemView()
}
