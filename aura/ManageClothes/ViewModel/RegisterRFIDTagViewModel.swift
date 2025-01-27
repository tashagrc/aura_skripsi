//
//  RegisterRFIDTagViewModel.swift
//  aura
//
//  Created by Natasha Radika on 27/01/25.
//

import SwiftUI

class RegisterRFIDTagViewModel: ObservableObject {
    @Published var isFound = false
    @Published var clothesModel: ClothesModel

    init(clothesModel: ClothesModel) {
        self.clothesModel = clothesModel
    }
}

