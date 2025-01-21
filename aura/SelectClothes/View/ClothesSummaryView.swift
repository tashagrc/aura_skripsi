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
        VStack(alignment: .leading, spacing: 20) {
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Select a clothes")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Show clothes that match with XX")
                    .font(.title3)
            }
            .padding(.horizontal, 20)
            
            SummaryCardViewComponent(iconName: "lightbulb.max", text: "Your clothes create a neutral color with soft profile.")
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(cardData, id: \.title) { card in
                        ClothesCardViewComponent(title: card.title, description: card.description)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding()
                
            }
            
            VStack(alignment: .leading) {
                ButtonViewComponent(title: "Help me find clothes", destination: FindClothesView(), isPrimary: true)
                ButtonViewComponent(title: "I can do it by myself", destination: SuccessView(iconName: "checkmark.circle", title: "Amazing choice!", subtitle: "Pick up all of your selected clothes"), isPrimary: false)
            }
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
    }
}

#Preview {
    ClothesSummaryView()
}
