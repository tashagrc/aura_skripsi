//
//  FindClothesViewModel.swift
//  aura
//
//  Created by Natasha Radika on 30/01/25.
//

import SwiftUI

class FindClothesViewModel: ObservableObject {
    @Published var cardData: [(title: String, status: Bool)] = [
        (title: "Card 1", status: true),
        (title: "Card 2", status: false)
    ]
}
