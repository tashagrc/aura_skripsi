//
//  RegisterRFIDTagViewModel.swift
//  aura
//
//  Created by Natasha Radika on 27/01/25.
//

import SwiftUI
import SwiftData

class RegisterRFIDTagViewModel: ObservableObject {
    @Published var isFound = false
    @Published var clothesModel: ClothesModel
    @Environment(\.modelContext) var modelContext

    init(clothesModel: ClothesModel) {
        self.clothesModel = clothesModel
    }
    
    func startTagDetection() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isFound = true
            self.saveClothesModel()
        }
    }
    
    private func saveClothesModel() {
        clothesModel.rfid_id = UUID().uuidString
        do {
            try modelContext.insert(clothesModel)
            try modelContext.save()
            print("ClothesModel saved successfully.")
        } catch {
            print("Failed to save ClothesModel: \(error)")
        }
    }
}

