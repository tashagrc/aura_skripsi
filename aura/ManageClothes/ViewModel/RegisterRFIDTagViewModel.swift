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
    var modelContext: ModelContext? = nil

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
        print("saved in rfid page: " + clothesModel.desc)
        DatabaseManager.shared.saveClothesModel(clothesModel, using: modelContext!)
    }
}

