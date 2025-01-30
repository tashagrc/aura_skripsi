//
//  FindClothesViewModel.swift
//  aura
//
//  Created by Natasha Radika on 30/01/25.
//

import SwiftUI
import CoreNFC

class FindClothesViewModel: ObservableObject {
    @Published var cardData: [(rfid_id: String, title: String, status: Bool)]
    @Published var errorMessage: String?  // For toast messages
    
    private var foundTags: Set<String> = []  // Track found tags
    
    init(selectedClothes: [ClothesModel]) {
        self.cardData = selectedClothes.map { (rfid_id: $0.rfid_id, title: $0.desc, status: false) }
    }
    
    func startScanning() {
        NFCManager.shared.startScanning { [weak self] scannedTag in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if let index = self.cardData.firstIndex(where: { $0.rfid_id == scannedTag }) {
                    if !self.cardData[index].status { // Ensure it hasn't already been marked as found
                        self.cardData[index].status = true
                        self.foundTags.insert(scannedTag)
                        print("✅ Found: \(scannedTag)")
                        
                        // Stop scanning if all clothes are found
                        if self.foundTags.count == self.cardData.count {
                            print("✅ All clothes found! Stopping NFC session.")
                            NFCManager.shared.invalidateSession()  // Stop NFC scanning
                            return // Exit to prevent unnecessary restarts
                        }
                    }
                } else {
                    // Show toast message for an invalid tag
                    self.errorMessage = "❌ This tag doesn't match any selected clothes. Try again."
                    
                    // Hide the toast after 2 seconds and restart scanning if needed
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.errorMessage = nil
                        
                        if self.foundTags.count < self.cardData.count {
                            print("🔄 Restarting scan...")
                            self.startScanning()
                        }
                    }
                }
            }
        }
    }
}
