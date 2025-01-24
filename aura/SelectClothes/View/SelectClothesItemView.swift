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
        VStack(alignment: .leading, spacing: 20) {
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Select a clothes")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Show clothes that match with XX")
                    .font(.title3)
            }
            .padding(.horizontal, 20)
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(cardData, id: \.title) { card in
                        NavigationLink(destination: ClothesSummaryView()) {
                            ClothesCardViewComponent(title: card.title, description: card.description, imageName: "clothes_sample")
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
                .padding()
                
            }
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
    }
}

#Preview {
    SelectClothesItemView()
}
