//
//  ClothesListViewModel.swift
//  aura
//
//  Created by Natasha Radika on 27/01/25.
//

import SwiftUI
import SwiftData

class ClothesListViewModel: ObservableObject {
    @Published var clothes: [ClothesModel] = []
    
    func fetchData(using modelContext: ModelContext) {
        DatabaseManager.shared.fetchData(using: modelContext) { fetchedClothes in
            self.clothes = fetchedClothes
        }
    }
    
    func deleteClothes(clothes: ClothesModel, using modelContext: ModelContext) {
        DatabaseManager.shared.deleteClothesModel(clothes, using: modelContext)
    }
    
    static func loadImageFromDocuments(imagePath: String) -> UIImage? {
        return DocumentManager.loadImageFromDocuments(imagePath: imagePath)
    }
}


