//
//  ClothesDetailViewModel.swift
//  aura
//
//  Created by Natasha Radika on 27/01/25.
//

import SwiftUI
import SwiftData

class ClothesDetailViewModel: ObservableObject {
    enum Mode {
        case add
        case view
    }
    
    @Published var clothesModel: ClothesModel
    @Published var isEditing = false
    @Published var image: UIImage?
    @Published var title: String
    @Published var type: String
    @Published var category: String
    @Published var color: String
    @Published var pattern: String
    @Published var occasion: String
    
    var modelContext: ModelContext?
    var mode: Mode
    
    let columns = [
        GridItem(.fixed(120), alignment: .leading),
        GridItem(.flexible(), alignment: .leading),
    ]
    
    var pickerData: [String: [String]] = [
        "Type": ["Select Type", "Blazer", "Blouse", "Crop Top", "Dress", "Hoodie", "Longsleeve", "Nothing", "Outwear", "Pants", "Polo", "Shirt", "Shorts", "Skirt", "T-Shirt", "Undershirt"],
        "Category": ["Select Category", "Top", "Bottom", "Outer"],
        "Color": ["Select Color", "Black", "Blue", "Brown", "Green", "Grey", "Orange", "Pink", "Purple", "Red", "White", "Yellow"],
        "Pattern": ["Select Pattern", "Plain", "Animal", "Cartoon", "Floral", "Polka Dot", "Squares", "Stripes", "Tribal"],
        "Occasion": ["Select Occasion", "Casual", "Formal", "Sports Wear", "Streetwear", "Other"]
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
    
    init(clothesModel: ClothesModel, mode: Mode, image: UIImage? = nil) {
        self.clothesModel = clothesModel
        self.mode = mode
        self.image = image
        self.title = clothesModel.desc
        self.type = clothesModel.type
        self.category = clothesModel.category
        self.color = clothesModel.color
        self.pattern = clothesModel.pattern
        self.occasion = clothesModel.occasion
    }
    
    func prepareForNextPage() {
        clothesModel.type = type
        clothesModel.category = category
        clothesModel.color = color
        clothesModel.pattern = pattern
        clothesModel.occasion = occasion
        clothesModel.desc = title
    }
    
    private func updateField(key: String, value: String) {
        switch key {
        case "Type": clothesModel.type = value
        case "Category": clothesModel.category = value
        case "Color": clothesModel.color = value
        case "Pattern": clothesModel.pattern = value
        case "Occasion": clothesModel.occasion = value
        default: break
        }
        
        if mode == .view {
            saveChangesIfNeeded()
        }
    }
    
    func saveChangesIfNeeded() {
        guard mode == .view, let context = modelContext else { return }
        DatabaseManager.shared.saveClothesModel(clothesModel, using: context)
    }
}






