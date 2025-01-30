//
//  FindClothesViewModel.swift
//  aura
//
//  Created by Natasha Radika on 30/01/25.
//

import SwiftUI

class FindClothesViewModel: ObservableObject {
    @Published var cardData: [(title: String, status: Bool)]
    
    init(selectedClothes: [ClothesModel]) {
        self.cardData = selectedClothes.map {
            (title: $0.desc, status: false)
        }
        simulateScanning()
    }
    
    private func simulateScanning() {
        for i in cardData.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i + 1) * 3) {
                self.cardData[i].status = true
            }
        }
    }
}
