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
                
                Text("Scan each of your clothes with your phone until you hear a beeping sound")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
            }
            
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(cardData, id: \.title) { card in
                        FindCardViewComponent(clothesName: card.title, status: card.status)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding()
                
            }
            
            ButtonViewComponent(title: "Continue", destination: SuccessView(iconName: "checkmark.circle", title: "Amazing choice!", subtitle: "Pick up all of your selected clothes"), isPrimary: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
    }
}

#Preview {
    FindClothesView()
}
