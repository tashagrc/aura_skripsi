//
//  FindCardViewComponent.swift
//  aura
//
//  Created by Natasha Radika on 21/01/25.
//

import SwiftUI

struct FindCardViewComponent: View {
    var clothesName: String
    var status: Bool
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Text(clothesName)
                .font(.body)
                .multilineTextAlignment(.leading)
                .foregroundColor(.primary)
            Spacer()
            Text(status ? "Found" : "Not Found")
                .font(.body)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .foregroundColor(status ? Color.green : Color.red)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding(.horizontal)
    }
}

