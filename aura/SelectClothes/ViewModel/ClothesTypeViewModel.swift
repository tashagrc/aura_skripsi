//
//  ClothesTypeViewModel.swift
//  aura
//
//  Created by Natasha Radika on 28/01/25.
//

import SwiftUI

class ClothesTypeViewModel: ObservableObject {
    @Published var selectedOccasion: String
    @Published var selectedClothesTypes: [String] = []
    
    let clothesTypeOptions: [String] = ["Top", "Bottom", "Outer"]

    init(selectedOccasion: String) {
        self.selectedOccasion = selectedOccasion
    }
    
}
