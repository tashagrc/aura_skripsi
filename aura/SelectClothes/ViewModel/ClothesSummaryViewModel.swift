//
//  ClothesSummaryViewModel.swift
//  aura
//
//  Created by Natasha Radika on 28/01/25.
//

import SwiftUI

class ClothesSummaryViewModel: ObservableObject {
    @Published var occasion: String
    @Published var selectedClothes: [String]
    
    init(occasion: String, selectedClothes: [String]) {
        self.occasion = occasion
        self.selectedClothes = selectedClothes
    }
}
