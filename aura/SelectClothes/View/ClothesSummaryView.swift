//
//  ClothesSummaryView.swift
//  aura
//
//  Created by Natasha Radika on 21/01/25.
//

import SwiftUI

struct ClothesSummaryView: View {
    
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
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Show clothes that match with XX")
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 16)
            .padding(.top, 40)
            
            SummaryCardViewComponent(iconName: "lightbulb.max", text: "Your clothes create a neutral color with soft profile.")
                .padding(.horizontal, 16)
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(cardData, id: \.title) { card in
                        ClothesCardViewComponent(title: card.title, description: card.description, imagePath: "clothes_sample")
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
            }
            
            VStack(alignment: .leading, spacing: 16) {
                NavigationLink(destination: FindClothesView()) {
                    ButtonViewComponent(title: "Help me find clothes", isPrimary: true)
                }
                
                NavigationLink(destination: SuccessView(iconName: "checkmark.circle", title: "Amazing choice!", subtitle: "Pick up all of your selected clothes", returnTab: 0)) {
                    ButtonViewComponent(title: "I can do it by myself", isPrimary: false)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    ClothesSummaryView()
}
