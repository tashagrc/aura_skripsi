//
//  Clothes.swift
//  aura
//
//  Created by Natasha Radika on 27/01/25.
//

import Foundation
import SwiftData

@Model
class ClothesModel {
    var id: String
    var rfid_id: String
    var occasion: String
    var category: String
    var type: String
    var color: String
    var color_code: String
    var pattern: String
    var desc: String
    var imagePath: String
    
    init(id: String, rfid_id: String, occasion: String, category: String, type: String, color: String, color_code: String, pattern: String, desc: String, imagePath: String) {
        self.id = id
        self.rfid_id = rfid_id
        self.occasion = occasion
        self.category = category
        self.type = type
        self.color = color
        self.color_code = color_code
        self.pattern = pattern
        self.desc = desc
        self.imagePath = imagePath
    }
}

