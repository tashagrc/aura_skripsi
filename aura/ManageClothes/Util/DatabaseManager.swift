//
//  DatabaseManager.swift
//  aura
//
//  Created by Natasha Radika on 28/01/25.
//

import Foundation
import SwiftData

class DatabaseManager {
    
    static let shared = DatabaseManager()
    private init() {}
    
    // Fetch data from the database
    func fetchData(using modelContext: ModelContext, completion: @escaping ([ClothesModel]) -> Void) {
        do {
            let descriptor = FetchDescriptor<ClothesModel>(sortBy: [SortDescriptor(\.type)])
            let fetchedClothes = try modelContext.fetch(descriptor)
            DispatchQueue.main.async {
                completion(fetchedClothes)
            }
        } catch {
            print("Fetch failed with error: \(error)")
        }
    }
    
    // Save a ClothesModel to the database
    func saveClothesModel(_ clothesModel: ClothesModel, using modelContext: ModelContext) {
        modelContext.insert(clothesModel)
        do {
            try modelContext.save()
        } catch {
            print("Save failed with error: \(error)")
        }
    }
    
    func deleteClothesModel(_ clothesModel: ClothesModel, using modelContext: ModelContext) {
        modelContext.delete(clothesModel)
        do {
            try modelContext.save()
        } catch {
            print("Delete failed with error: \(error)")
        }
    }
}


