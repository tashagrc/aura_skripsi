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
        NFCManager.shared.startScanning { [weak self] scannedText in
            guard let self = self else { return }
            
            if self.validateRFID(scannedText) {
                self.isFound = true
                self.saveClothesModel(scannedText)
            } else {
                print("Invalid Aura tag. Ensure it starts with 'AURA' and is not registered.")
            }
        }
    }
    
    private func validateRFID(_ rfidText: String) -> Bool {
        guard rfidText.contains("AURA") else {
            print("RFID does not contains 'AURA'.")
            return false
        }
        
        let existingRFIDs = DatabaseManager.shared.getAllRFIDs(using: modelContext!)
        if existingRFIDs.contains(rfidText) {
            print("RFID already registered.")
            return false
        }
        
        return true
    }
    
    private func saveClothesModel(_ rfidText: String) {
        clothesModel.rfid_id = rfidText
        print("saved in rfid page: " + clothesModel.desc)
        DatabaseManager.shared.saveClothesModel(clothesModel, using: modelContext!)
    }
}

