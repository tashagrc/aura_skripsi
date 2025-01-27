//
//  InsertClothesViewModel.swift
//  aura
//
//  Created by Natasha Radika on 27/01/25.
//

import Foundation
import SwiftUI
import PhotosUI

class InsertClothesViewModel: ObservableObject {
    @Published var showActionSheet = false
    @Published var showCamera = false
    @Published var showPhotoPicker = false
    @Published var selectedImage: UIImage?
    @Published var selectedItem: PhotosPickerItem?
    @Published var navigateToImage = false
    
    func handlePhotoPickerSelection() {
        Task {
            if let data = try? await selectedItem?.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                selectedImage = uiImage
                navigateToImage = true
            }
        }
    }
}
