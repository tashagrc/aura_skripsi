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
                    .accessibilityLabel("Clothes Summary")
                
                Text("Here are the clothes you selected")
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .accessibilityLabel("Here are the clothes you selected")
            }
            .padding(.horizontal, 16)
            .padding(.top, 40)
            
            SummaryCardViewComponent(iconName: "lightbulb.max", text: "Your clothes create a neutral color with soft profile.")
                .padding(.horizontal, 16)
                .accessibilityLabel("Clothes create a neutral color with soft profile")
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.selectedClothes, id: \.self) { clothes in
                        ClothesCardViewComponent(
                            title: clothes.desc,
                            description: clothes.occasion + ", " + clothes.category + ", " + clothes.color + ", " + clothes.pattern,
                            image: ClothesSummaryViewModel.loadImageFromDocuments(imagePath: clothes.imagePath)
                        )
                        .frame(maxWidth: .infinity)
                        .accessibilityLabel("\(clothes.desc), \(clothes.occasion), \(clothes.category), \(clothes.color), \(clothes.pattern)")
                        .accessibilityHint("Tap to view details for \(clothes.desc)")
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                NavigationLink(destination: FindClothesView(selectedClothes: viewModel.selectedClothes)) {
                    ButtonViewComponent(title: "Help me find clothes", isPrimary: true)
                        .accessibilityLabel("Help me find clothes")
                        .accessibilityHint("Tap to get assistance in finding clothes based on your selection.")
                }
                
                NavigationLink(destination: SuccessView(iconName: "checkmark.circle", title: "Amazing choice!", subtitle: "Pick up all of your selected clothes", returnTab: 0)) {
                    ButtonViewComponent(title: "I can do it by myself", isPrimary: false)
                        .accessibilityLabel("I can do it by myself")
                        .accessibilityHint("Tap if you want to proceed without assistance.")
                }
            }
            .padding(.horizontal, 16)
        }
    }
}
