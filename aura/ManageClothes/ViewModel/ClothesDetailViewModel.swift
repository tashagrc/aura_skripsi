//
//  ClothesDetailViewModel.swift
//  aura
//
//  Created by Natasha Radika on 27/01/25.
//

import SwiftUI

class ClothesDetailViewModel: ObservableObject {
    @Published var clothesModel: ClothesModel
    @Published var isEditing = false
    @Published var image: UIImage?
    
    @Published var title: String
    @Published var type: String
    @Published var category: String
    @Published var color: String
    @Published var pattern: String
    @Published var occasion: String

    let columns = [
        GridItem(.fixed(120), alignment: .leading),
        GridItem(.flexible(), alignment: .leading),
    ]
    
    var pickerData: [String: [String]] = [
        "Type": ["T-shirt", "Sweater", "Jeans"],
        "Category": ["Top", "Bottom", "Outerwear"],
        "Color": ["Yellow", "Red", "Blue", "Green", "Black"],
        "Pattern": ["Solid", "Striped", "Polka dot", "Plaid"],
        "Occasion": ["Casual", "Formal", "Sports"]
    ]
    
    var fields: [(String, Binding<String>)] {
        [
            ("Type", Binding(get: { self.type }, set: { self.type = $0 })),
            ("Category", Binding(get: { self.category }, set: { self.category = $0 })),
            ("Color", Binding(get: { self.color }, set: { self.color = $0 })),
            ("Pattern", Binding(get: { self.pattern }, set: { self.pattern = $0 })),
            ("Occasion", Binding(get: { self.occasion }, set: { self.occasion = $0 }))
        ]
    }
    
    init(clothesModel: ClothesModel, image: UIImage? = nil) {
        self.clothesModel = clothesModel
        self.title = clothesModel.desc
        self.type = clothesModel.type
        self.category = clothesModel.category
        self.color = clothesModel.color
        self.pattern = clothesModel.pattern
        self.occasion = clothesModel.occasion
        self.image = image
    }
    
    func prepareForNextPage() {
        clothesModel.type = type
        clothesModel.category = category
        clothesModel.color = color
        clothesModel.pattern = pattern
        clothesModel.occasion = occasion
        clothesModel.desc = title
    }
}






