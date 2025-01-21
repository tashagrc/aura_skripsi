//
//  ButtonViewComponent.swift
//  aura
//
//  Created by Natasha Radika on 21/01/25.
//

import SwiftUI

struct ButtonViewComponent<Destination: View>: View {
    var title: String
    var destination: Destination
    var isPrimary: Bool

    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(isPrimary ? .white : .blue)
                .padding()
                .frame(maxWidth: .infinity)
                .background(isPrimary ? Color.blue : Color.clear)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isPrimary ? Color.clear : Color.blue, lineWidth: 2)
                )
        }
        .padding(.top, 20)
    }
}


