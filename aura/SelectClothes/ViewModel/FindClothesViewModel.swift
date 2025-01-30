//
//  FindClothesViewModel.swift
//  aura
//
//  Created by Natasha Radika on 30/01/25.
//

import SwiftUI

import SwiftUI
import CoreNFC

class FindClothesViewModel: ObservableObject {
    @Published var cardData: [(title: String, status: Bool)]
    @Published var errorMessage: String?  // For toast messages
    
    private var foundTags: Set<String> = []  // Track found tags
    
    init(selectedClothes: [ClothesModel]) {
        self.cardData = selectedClothes.map { (title: $0.desc, status: false) }
    }
    
    func startScanning() {
        NFCManager.shared.startScanning { [weak self] scannedTag in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if let index = self.cardData.firstIndex(where: { $0.title == scannedTag }) {
                    if !self.cardData[index].status { // Ensure it hasn't already been marked as found
                        self.cardData[index].status = true
                        self.foundTags.insert(scannedTag)
                    }
                    
                    // Stop scanning if all clothes are found
                    if self.foundTags.count == self.cardData.count {
                        print("All clothes found!")
                    } else {
                        self.startScanning() // Continue scanning if not all clothes are found
                    }
                } else {
                    // Show toast message for an invalid tag
                    self.errorMessage = "This tag doesn't match any selected clothes. Try again."
                    
                    // Hide the toast after 2 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.errorMessage = nil
                    }
                    
                    self.startScanning() // Keep scanning for valid tags
                }
            }
        }
    }
}
