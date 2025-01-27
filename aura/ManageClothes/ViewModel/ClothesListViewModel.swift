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
        do {
            let descriptor = FetchDescriptor<ClothesModel>(sortBy: [SortDescriptor(\.type)])
            let fetchedClothes = try modelContext.fetch(descriptor)
            DispatchQueue.main.async {
                self.clothes = fetchedClothes
            }
        } catch {
            print("Fetch failed with error: \(error)")
        }
    }
}

