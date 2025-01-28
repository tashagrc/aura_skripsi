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
    
    var body: some View {
        VStack(spacing: 24) {
            
            Text("What do you want to wear?")
                .font(.title)
                .multilineTextAlignment(.leading)
                .fontWeight(.bold)
                .padding(.top, 40)
                .frame(maxWidth: .infinity, alignment: .leading)
            
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
                }
            }
            
            
            Spacer()
            
            NavigationLink(destination: {
                let clothesItemViewModel = ClothesItemViewModel(
                    selectedOccasion: viewModel.selectedOccasion,
                    selectedClothesTypes: viewModel.selectedClothesTypes
                )
                ClothesItemView(viewModel: clothesItemViewModel)
            }) {
                ButtonViewComponent(title: "Continue", isPrimary: true)
            }
        }
        .padding(.horizontal, 16)
    }
        
}



