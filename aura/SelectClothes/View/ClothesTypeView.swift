//
//  SelectClothesTypeView.swift
//  aura
//
//  Created by Natasha Radika on 20/01/25.
//

import SwiftUI

struct ClothesTypeView: View {
    
    @State private var checkboxStates: [Bool] = [false, false, false]
    @ObservedObject var viewModel: ClothesTypeViewModel
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack(spacing: 24) {
            
            Text("What do you want to wear?")
                .font(.title)
                .multilineTextAlignment(.leading)
                .fontWeight(.bold)
                .padding(.top, 40)
                .frame(maxWidth: .infinity, alignment: .leading)
                .accessibilityLabel("What do you want to wear?")  // Label for the question
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(0..<viewModel.clothesTypeOptions.count, id: \.self) { index in
                    CheckboxViewComponent(isChecked: $checkboxStates[index], label: viewModel.clothesTypeOptions[index])
                        .onChange(of: checkboxStates[index]) { isChecked in
                            let type = viewModel.clothesTypeOptions[index]
                            if isChecked {
                                viewModel.selectedClothesTypes.append(type)
                            } else {
                                viewModel.selectedClothesTypes.removeAll { $0 == type }
                            }
                        }
                        .accessibilityLabel(viewModel.clothesTypeOptions[index])  // Label for the checkbox option
                        .accessibilityHint("Tap to select or deselect \(viewModel.clothesTypeOptions[index])")  // Hint for checkbox action
                }
            }
            
            Spacer()
            
            NavigationLink(destination: {
                let clothesItemViewModel = ClothesItemViewModel(
                    selectedOccasion: viewModel.selectedOccasion,
                    selectedClothesTypes: viewModel.selectedClothesTypes, modelContext: modelContext
                )
                ClothesItemView(viewModel: clothesItemViewModel)
            }) {
                ButtonViewComponent(title: "Continue", isPrimary: true)
                    .accessibilityLabel("Continue")  // Label for the Continue button
                    .accessibilityHint("Tap to proceed to select clothes based on your chosen types.")  // Hint for button action
            }
        }
        .padding(.horizontal, 16)
    }
}




