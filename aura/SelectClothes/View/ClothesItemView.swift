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
                Text("Select a clothing item")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Showing \(viewModel.filteredClothes.count) options for \(viewModel.selectedClothesTypes.filter { category in !viewModel.selectedClothes.contains { $0.category == category } }.joined(separator: ", "))")
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.filteredClothes, id: \.id) { clothes in
                        NavigationLink(destination: nextView(for: clothes)) {
                            ClothesCardViewComponent(title: clothes.desc, description: clothes.occasion + ", " + clothes.category + ", " + clothes.color + ", " + clothes.pattern, image: ClothesItemViewModel.loadImageFromDocuments(imagePath: clothes.imagePath))
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

    /// Determines the next screen after selecting a clothing item
    private func nextView(for selectedClothes: ClothesModel) -> some View {
        let newViewModel = ClothesItemViewModel(
            selectedOccasion: viewModel.selectedOccasion,
            selectedClothesTypes: viewModel.selectedClothesTypes,
            modelContext: viewModel.modelContext
        )
        newViewModel.selectedClothes = viewModel.selectedClothes + [selectedClothes]
        newViewModel.fetchFilteredClothes()

        if newViewModel.isSelectionComplete {
            return AnyView(ClothesSummaryView(
                viewModel: ClothesSummaryViewModel(
                    occasion: viewModel.selectedOccasion,
                    selectedClothes: newViewModel.selectedClothes
                )
            ))
        } else {
            return AnyView(ClothesItemView(viewModel: newViewModel))
        }
    }
}
