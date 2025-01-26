//
//  FindCardViewComponent.swift
//  aura
//
//  Created by Natasha Radika on 21/01/25.
//

import SwiftUI

struct FindCardViewComponent: View {
    var itemName: String
    var status: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Text(itemName)
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(status ? "Found" : "Not Found")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(status ? Color.green.opacity(0.2) : Color.red.opacity(0.2))
                .foregroundColor(status ? Color.green : Color.red)
                .cornerRadius(8)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.1))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
        )
    }
}

