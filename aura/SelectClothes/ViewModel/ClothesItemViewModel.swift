//
//  ClothesItemViewModel.swift
//  aura
//
//  Created by Natasha Radika on 28/01/25.
//

import SwiftUI

class ClothesItemViewModel: ObservableObject {
    @Published var selectedOccasion: String
    @Published var selectedClothesTypes: [String]
    @Published var filteredClothes: [(title: String, description: String)] = []
    @Published var selectedClothes: [String] = []
    
    init(selectedOccasion: String, selectedClothesTypes: [String]) {
        self.selectedOccasion = selectedOccasion
        self.selectedClothesTypes = selectedClothesTypes
        self.updateFilteredClothes()
    }
    
    private func getFilteredClothes(for types: [String]) -> [(title: String, description: String)] {
        return types.flatMap { type in
            [
                (title: "\(type) 1", description: "A great \(type) for \(selectedOccasion)"),
                (title: "\(type) 2", description: "Another great \(type) option for \(selectedOccasion)")
            ]
        }
    }
    
    func updateFilteredClothes() {
        let remainingTypes = selectedClothesTypes.filter { !selectedClothes.contains($0) }
        self.filteredClothes = getFilteredClothes(for: remainingTypes)
    }

    var isSelectionComplete: Bool {
        return selectedClothes.count == selectedClothesTypes.count
    }
    
}
