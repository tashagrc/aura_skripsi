//
//  ClothesItemViewModel.swift
//  aura
//
//  Created by Natasha Radika on 28/01/25.
//

import SwiftUI
import SwiftData

class ClothesItemViewModel: ObservableObject {
    @Published var selectedOccasion: String
    @Published var selectedClothesTypes: [String]  // All categories selected initially
    @Published var selectedClothes: [ClothesModel] = []  // Stores chosen clothes
    @Published var filteredClothes: [ClothesModel] = []  // Clothes available for selection

    var modelContext: ModelContext

    init(selectedOccasion: String, selectedClothesTypes: [String], modelContext: ModelContext) {
        self.selectedOccasion = selectedOccasion
        self.selectedClothesTypes = selectedClothesTypes
        self.modelContext = modelContext
        fetchFilteredClothes()
    }
    
    /// Fetch clothes from SwiftData based on occasion and available categories
    func fetchFilteredClothes() {
        DatabaseManager.shared.fetchData(using: modelContext) { [weak self] clothesList in
            guard let self = self else { return }

            print("✅ All Clothes from DB: \(clothesList.count) items")

            // Step 1: Filter by occasion
            let filteredByOccasion = clothesList.filter { $0.occasion == self.selectedOccasion }
            print("🎯 Clothes matching occasion '\(self.selectedOccasion)': \(filteredByOccasion.count) items")

            // Step 2: Find remaining categories that haven't been selected
            let remainingCategories = selectedClothesTypes.filter { category in
                !self.selectedClothes.contains { $0.category == category }
            }
            print("🛑 Remaining categories to pick from: \(remainingCategories)")

            // Step 3: Filter by remaining categories
            let finalFilteredClothes = filteredByOccasion.filter { remainingCategories.contains($0.category) }
            print("✅ Final filtered clothes: \(finalFilteredClothes.count) items")

            // Ensure UI updates on main thread
            DispatchQueue.main.async {
                self.filteredClothes = finalFilteredClothes
            }
        }
    }

    
    /// Check if all required clothes categories have been selected
    var isSelectionComplete: Bool {
        return selectedClothes.count == selectedClothesTypes.count
    }
    
    static func loadImageFromDocuments(imagePath: String) -> UIImage? {
        return DocumentManager.loadImageFromDocuments(imagePath: imagePath)
    }
}
