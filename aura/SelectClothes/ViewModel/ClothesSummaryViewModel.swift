//
//  ClothesSummaryViewModel.swift
//  aura
//
//  Created by Natasha Radika on 28/01/25.
//

import SwiftUI

class ClothesSummaryViewModel: ObservableObject {
    @Published var occasion: String
    @Published var selectedClothes: [ClothesModel]
    
    init(occasion: String, selectedClothes: [ClothesModel]) {
        self.occasion = occasion
        self.selectedClothes = selectedClothes
    }
    
    static func loadImageFromDocuments(imagePath: String) -> UIImage? {
        return DocumentManager.loadImageFromDocuments(imagePath: imagePath)
    }
}
