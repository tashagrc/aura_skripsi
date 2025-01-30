//
//  ClothesCardViewComponent.swift
//  aura
//
//  Created by Natasha Radika on 21/01/25.
//

import SwiftUI

struct ClothesCardViewComponent: View {
    var title: String
    var description: String
    var image: UIImage?
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .accessibilityHidden(true) // Since the image isn't critical for the user to interact with
            } else {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 50, height: 50)
                    .overlay(
                        Text("No Image")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .accessibilityLabel("No image available") // Describes the placeholder image
                    )
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .accessibilityLabel(title) // Ensure the title is accessible and clearly labeled
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .accessibilityLabel(description) // Ensure the description is also labeled
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        .accessibilityElement(children: .combine) // Combine the elements of the card into a single accessible unit
    }
}


