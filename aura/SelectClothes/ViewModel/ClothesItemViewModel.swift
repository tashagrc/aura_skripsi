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
    
    init(selectedOccasion: String, selectedClothesTypes: [String]) {
        self.selectedOccasion = selectedOccasion
        self.selectedClothesTypes = selectedClothesTypes
        self.filteredClothes = self.getFilteredClothes()
    }
    
    private func getFilteredClothes() -> [(title: String, description: String)] {
        return [
            (title: "Filtered Card 1", description: "Based on \(selectedClothesTypes.joined(separator: ", ")) for \(selectedOccasion)"),
            (title: "Filtered Card 2", description: "Great choice for \(selectedOccasion)"),
            (title: "Filtered Card 3", description: "Another great option!")
        ]
    }
    
}
