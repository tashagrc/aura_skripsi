//
//  DocumentManager.swift
//  aura
//
//  Created by Natasha Radika on 28/01/25.
//

import SwiftUI

public struct DocumentManager {
    static func loadImageFromDocuments(imagePath: String) -> UIImage? {
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        if let documentsDirectory = documentsDirectory {
            let fileURL = documentsDirectory.appendingPathComponent(imagePath)
            if fileManager.fileExists(atPath: fileURL.path) {
                return UIImage(contentsOfFile: fileURL.path)
            } else {
                print("Image not found at path: \(fileURL.path)")
            }
        }
        
        return nil
    }

    static func saveImageToDocuments(image: UIImage) -> String? {
        guard let data = image.jpegData(compressionQuality: 0.8) else {
            return nil
        }
        
        let fileName = UUID().uuidString + ".jpg"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileURL = documentsDirectory?.appendingPathComponent(fileName)
        
        do {
            if let fileURL = fileURL {
                try data.write(to: fileURL)
                return fileName
            }
        } catch {
            print("Error saving image: \(error)")
        }
        
        return nil
    }
}


