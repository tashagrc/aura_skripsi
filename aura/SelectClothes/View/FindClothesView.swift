//
//  FindClothesView.swift
//  aura
//
//  Created by Natasha Radika on 21/01/25.
//

import SwiftUI

struct FindClothesView: View {
    @StateObject private var viewModel: FindClothesViewModel
    
    init(selectedClothes: [ClothesModel]) {
        _viewModel =
        StateObject(wrappedValue: FindClothesViewModel(selectedClothes: selectedClothes))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            
            VStack(alignment: .center, spacing: 16) {
                Image(systemName: "tag")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.primary)
                
                Text("Scan each Aura Tag on your clothes with your phone until you hear a beep")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
            }
            .padding(.top, 40)
            
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.cardData, id: \.title) { card in
                        FindCardViewComponent(itemName: card.title, status: card.status)
                    }
                }
                .padding(.top, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            
            NavigationLink(destination: SuccessView(iconName: "checkmark.circle", title: "Amazing choice!", subtitle: "Pick up all of your selected clothes", returnTab: 0)) {
                ButtonViewComponent(title: "Continue", isPrimary: true)
            }
            
        }
        .padding(.horizontal, 16)
    }
}
