//
//  ButtonViewComponent.swift
//  aura
//
//  Created by Natasha Radika on 21/01/25.
//

import SwiftUI

struct ButtonViewComponent: View {
    var title: String
    var isPrimary: Bool

    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(isPrimary ? .white : .blue)
            .padding(.vertical, 14)
            .frame(maxWidth: .infinity)
            .background(isPrimary ? Color.blue : Color.clear)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isPrimary ? Color.clear : Color.blue, lineWidth: 2)
            )
            .shadow(
                color: isPrimary ? Color.blue.opacity(0.2) : Color.clear,
                radius: 4, x: 0, y: 2
            )
            .accessibilityLabel(title)  // Accessibility label for the button text
            .accessibilityHint("Tap to \(isPrimary ? "confirm" : "select") your action.") // Hint for the action
            .accessibilityAddTraits(.isButton) // Specifies that this is a button for accessibility
    }
}



