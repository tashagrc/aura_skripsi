//
//  CheckboxViewComponent.swift
//  aura
//
//  Created by Natasha Radika on 21/01/25.
//

import SwiftUI

struct CheckboxViewComponent: View {
    @Binding var isChecked: Bool
    let label: String
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.2)) {
                isChecked.toggle()
            }
        }) {
            HStack {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(isChecked ? .blue : .gray)
                
                Text(label)
                    .font(.body)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.blue.opacity(isChecked ? 0.1 : 0.05))
            .cornerRadius(8)
        }
        .buttonStyle(PlainButtonStyle())
        .contentShape(Rectangle()) // Expands tap area
        .accessibilityElement()
        .accessibilityLabel(label)
        .accessibilityAddTraits(.isButton)
        .accessibilityValue(isChecked ? "Checked" : "Unchecked")
    }
}

