//
//  TfLiteConstant.swift
//  aura
//
//  Created by Natasha Radika on 30/01/25.
//

import Foundation

let rgbClassifierLabels: [String] = ["Black", "Blue", "Brown", "Green", "Grey", "Orange", "Pink", "Purple", "Red", "White", "Yellow"]
let clothesTypeLabels: [String] = ["Blazer", "Blouse", "Crop Top", "Dress", "Hoodie", "Longsleeve", "Nothing", "Outwear", "Pants", "Polo", "Shirt", "Shorts", "Skirt", "T-Shirt", "Undershirt"]
let clothesPatternLabels: [String] = ["Animal", "Cartoon", "Floral", "Plain", "Polka Dot", "Squares", "Stripes", "Tribal"]
let clothesOccasionLabels: [String] = ["Casual", "Formal", "Other", "Sports Wear", "Streetwear"]

let colorToRGB: [String: [Int]] = [
    "Black": [0, 0, 0],
    "Blue": [0, 0, 255],
    "Brown": [165, 42, 42],
    "Green": [0, 128, 0],
    "Grey": [128, 128, 128],
    "Orange": [255, 165, 0],
    "Pink": [255, 192, 203],
    "Purple": [128, 0, 128],
    "Red": [255, 0, 0],
    "White": [255, 255, 255],
    "Yellow": [255, 255, 0]
]

let colorSchemeLabels: [String] = ["Adjacent Hue Clash", "Analogous", "Complementary", "Cool vs Warm Clash", "Monotone Chromatic", "Neutral", "Not Match", "Primary vs Secondary/Tertiary Clash"]
let colorProfileLabels: [String] = ["Balanced", "Soft", "Strong"]

let bottom: [String] = ["Pants", "Shorts", "Skirt"]
let outwear: [String] = ["Blazer", "Hoodie", "Outwear"]
let top: [String] = ["Blouse", "Crop Top", "Dress", "Longsleeve", "Polo", "Shirt", "T-Shirt", "Undershirt"]

let NUM_SCHEME_CLASSES = colorSchemeLabels.count
let NUM_COLOR_PROFILE_CLASSES = colorProfileLabels.count

let NUM_TYPE_CLASSES = clothesTypeLabels.count
let NUM_PATTERN_CLASSES = clothesPatternLabels.count
let NUM_OCCASION_CLASSES = clothesOccasionLabels.count

let INPUT_WIDTH = 150
let INPUT_HEIGHT = 150


