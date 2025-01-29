//
//  ClothesSummaryView.swift
//  aura
//
//  Created by Natasha Radika on 21/01/25.
//

import SwiftUI

struct ClothesSummaryView: View {
    
    @ObservedObject var viewModel: ClothesSummaryViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Clothes Summary")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Here are the clothes you selected")
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 16)
            .padding(.top, 40)
            
            SummaryCardViewComponent(iconName: "lightbulb.max", text: "Your clothes create a neutral color with soft profile.")
                .padding(.horizontal, 16)
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.selectedClothes, id: \.self) { clothes in
                        ClothesCardViewComponent(
                            title: clothes.desc,
                            description: "A great choice for your \(viewModel.occasion)"
                        )
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                NavigationLink(destination: FindClothesView()) {
                    ButtonViewComponent(title: "Help me find clothes", isPrimary: true)
                }
                
                NavigationLink(destination: SuccessView(iconName: "checkmark.circle", title: "Amazing choice!", subtitle: "Pick up all of your selected clothes", returnTab: 0)) {
                    ButtonViewComponent(title: "I can do it by myself", isPrimary: false)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}
