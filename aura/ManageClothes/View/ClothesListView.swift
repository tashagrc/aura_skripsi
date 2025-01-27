//
//  ClothesListView.swift
//  aura
//
//  Created by Natasha Radika on 22/01/25.
//

import SwiftUI

struct ClothesListView: View {
    var cardData = [
        (title: "Card 1", description: "Description of card 1"),
        (title: "Card 2", description: "Description of card 2"),
        (title: "Card 3", description: "Description of card 3")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("My Clothes")
                .font(.title)
                .multilineTextAlignment(.leading)
                .fontWeight(.bold)
                .padding(.top, 40)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(cardData, id: \.title) { card in
                        NavigationLink(destination: ClothesDetailView(viewModel: ClothesDetailViewModel())) {
                            ClothesCardViewComponent(title: card.title, description: card.description, imageName: "clothes_sample")
            
                        }
                    }
                }
                .padding(.top, 16)
                
            }
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    ClothesListView()
}
