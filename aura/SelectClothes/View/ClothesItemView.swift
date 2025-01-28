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
                Text("Showing \(viewModel.filteredClothes.count) options for \(viewModel.selectedClothesTypes.filter { !viewModel.selectedClothes.contains($0) }.joined(separator: ", "))")
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.filteredClothes, id: \.title) { card in
                        NavigationLink(
                            destination: {
                                let newViewModel = createNextViewModel(for: card.title)
                                if newViewModel.isSelectionComplete {
                                    ClothesSummaryView(
                                        viewModel: ClothesSummaryViewModel(
                                            occasion: viewModel.selectedOccasion,
                                            selectedClothes: viewModel.selectedClothes
                                        )
                                    )
                                } else {
                                    ClothesItemView(viewModel: newViewModel)
                                }
                            }
                        ) {
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

    private func createNextViewModel(for selectedClothes: String) -> ClothesItemViewModel {
        // Copy the current view model
        let newViewModel = ClothesItemViewModel(
            selectedOccasion: viewModel.selectedOccasion,
            selectedClothesTypes: viewModel.selectedClothesTypes
        )
        newViewModel.selectedClothes = viewModel.selectedClothes + [selectedClothes]
        newViewModel.updateFilteredClothes() // Recalculate based on remaining types
        return newViewModel
    }
}
