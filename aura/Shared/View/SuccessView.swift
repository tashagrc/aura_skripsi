//
//  SuccessView.swift
//  aura
//
//  Created by Natasha Radika on 21/01/25.
//

import SwiftUI

struct SuccessView: View {
    var iconName: String
    var title: String
    var subtitle: String
    var returnTab: Int
    
    var body: some View {
        VStack(spacing: 32) {
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
                .padding(.top, 40)
                .accessibilityLabel(title) // Reads out the title instead of just "icon"
                .accessibilityAddTraits(.isImage)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Text(subtitle)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
            }
            .accessibilityElement(children: .combine)
            .accessibilityLabel("\(title). \(subtitle)")
            
            Spacer()
            
            NavigationLink(
                destination: returnTab == 0 ? AnyView(OccasionView()) : AnyView(ManageClothesMenuView())
            ) {
                ButtonViewComponent(title: "Done", isPrimary: true)
            }
            .accessibilityHint("Returns to the main menu")
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

