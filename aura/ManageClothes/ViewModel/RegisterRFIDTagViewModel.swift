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
    @Published var errorMessage: String? // Holds the error message for the toast
    var modelContext: ModelContext? = nil

    init(clothesModel: ClothesModel) {
        self.clothesModel = clothesModel
    }
    
    func startTagDetection() {
        NFCManager.shared.startScanning { [weak self] scannedText in
            guard let self = self else { return }

            if self.validateRFID(scannedText) {
                DispatchQueue.main.async {
                    self.isFound = true
                    self.saveClothesModel(scannedText)
                    NFCManager.shared.invalidateSession() // Stop scanning once a valid tag is found
                }
            } else {
                // Restart scanning if the tag is invalid
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    if !self.isFound { // Only restart if the correct tag hasn't been found yet
                        self.startTagDetection()
                    }
                }
            }
        }
    }

    
    private func validateRFID(_ rfidText: String) -> Bool {
        guard rfidText.contains("AURA") else {
            showError("Invalid tag. Ensure it starts with 'AURA'.")
            return false
        }
        
        guard let modelContext else {
            showError("Database error. Please try again.")
            return false
        }
        
        let existingRFIDs = DatabaseManager.shared.getAllRFIDs(using: modelContext)
        if existingRFIDs.contains(rfidText) {
            showError("This tag is already registered.")
            return false
        }
        
        return true
    }
    
    private func saveClothesModel(_ rfidText: String) {
        guard let modelContext else {
            showError("Database error. Please try again.")
            return
        }
        
        clothesModel.rfid_id = rfidText
        DatabaseManager.shared.saveClothesModel(clothesModel, using: modelContext)
    }

    private func showError(_ message: String) {
        DispatchQueue.main.async {
            self.errorMessage = message
        }
    }
}



