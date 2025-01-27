//
//  ClothesDetailViewModel.swift
//  aura
//
//  Created by Natasha Radika on 27/01/25.
//

import SwiftUI

class ClothesDetailViewModel: ObservableObject {
    @Published var text = "Red T-shirt"
    @Published var isEditing = false
    @Published var isNext = false
    @Published var image: UIImage?
    
    let data = [
        ("Type", "T-shirt"),
        ("Category", "Top"),
        ("Color", "Yellow"),
        ("Pattern", "Polka dot"),
        ("Occasion", "Casual")
    ]
    
    let columns = [
        GridItem(.fixed(120), alignment: .leading),
        GridItem(.flexible(), alignment: .leading),
    ]
    
    @Published var selection = "T-Shirt"
    let colors = ["T-Shirt", "Green", "Blue", "Black", "Tartan"]
    
    init(image: UIImage? = nil, isNext: Bool = false) {
        self.image = image
        self.isNext = isNext
    }
}


