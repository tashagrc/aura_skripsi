//
//  FindClothesView.swift
//  aura
//
//  Created by Natasha Radika on 21/01/25.
//

import SwiftUI

struct FindClothesView: View {
    
    var cardData = [
        (title: "Card 1", status: true),
        (title: "Card 2", status: false)
        
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            VStack(alignment: .center) {
                Image(systemName: "tag")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.primary)
                
                Text("Scan each Aura Tag on your clothes with your phone until you hear a beep")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
            }
            
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(cardData, id: \.title) { card in
                        FindCardViewComponent(itemName: card.title, status: card.status)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding()
                
            }
            
            NavigationLink(destination: SuccessView(iconName: "checkmark.circle", title: "Amazing choice!", subtitle: "Pick up all of your selected clothes", returnTab: 0)) {
                ButtonViewComponent(title: "Continue", isPrimary: true)
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
    }
}

#Preview {
    FindClothesView()
}
