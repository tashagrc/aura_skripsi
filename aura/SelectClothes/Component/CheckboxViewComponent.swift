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
            isChecked.toggle()
        }) {
            HStack {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(isChecked ? .blue : .gray)
                Text(label)
                    .font(.body)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
