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
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(subtitle)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            NavigationLink(
                destination: returnTab == 0 ? AnyView(OccasionView()) : AnyView(ManageClothesMenuView())
            ) {
                ButtonViewComponent(title: "Done", isPrimary: true)
            }
            
            
        
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)

        
    }
        
}
