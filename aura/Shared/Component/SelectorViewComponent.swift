//
//  OccasionSelectorViewComponent.swift
//  aura
//
//  Created by Natasha Radika on 21/01/25.
//

import SwiftUI

struct SelectorViewComponent: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
                .frame(width: 40, height: 40)
                .background(Color.blue.opacity(0.2))
                .cornerRadius(8)
                .accessibilityHidden(true) // Hides icon from VoiceOver since it will be included in the label
            
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .lineLimit(1)
                .truncationMode(.tail)
            
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.1))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue.opacity(0.4), lineWidth: 1)
        )
        .contentShape(Rectangle()) // Ensures tappable area is the full rectangle
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(title), selectable option")
        .accessibilityHint("Double-tap to select this option")
    }
}

