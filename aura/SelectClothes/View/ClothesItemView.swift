//
//  SelectClothesItemView.swift
//  aura
//
//  Created by Natasha Radika on 21/01/25.
//

import SwiftUI

struct ClothesItemView: View {
    
    @ObservedObject var viewModel: ClothesItemViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Select a clothes")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Text("Show clothes that match with \(viewModel.selectedClothesTypes.joined(separator: ", ")) for \(viewModel.selectedOccasion)")
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.filteredClothes, id: \.title) { card in
                        NavigationLink(destination: ClothesSummaryView()) {
                            ClothesCardViewComponent(title: card.title, description: card.description, image: nil)
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
