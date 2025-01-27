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
    
    func saveImageToDocuments(image: UIImage) -> String? {
        guard let data = image.jpegData(compressionQuality: 0.8) else {
            return nil
        }
        
        let fileName = UUID().uuidString + ".jpg"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileURL = documentsDirectory?.appendingPathComponent(fileName)
        
        do {
            if let fileURL = fileURL {
                try data.write(to: fileURL)
                return fileURL.path // Return the file path as a string
            }
        } catch {
            print("Error saving image: \(error)")
        }
        
        return nil
    }
}
