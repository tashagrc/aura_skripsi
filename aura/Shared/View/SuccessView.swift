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
    
    var body: some View {

        VStack(spacing: 20) {
            
            
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.green)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text(subtitle)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Spacer()
            
            NavigationLink(destination: SelectOccasionView()) {
                ButtonViewComponent(title: "Done", isPrimary: true)
            }
        
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

        
    }
        
}

