//
//  SelectClothesTypeView.swift
//  aura
//
//  Created by Natasha Radika on 20/01/25.
//

import SwiftUI

struct SelectClothesTypeView: View {
    
    @State private var checkboxStates: [Bool] = [false, false, false]
    private var clothesType: [String] = ["Top Wear", "Bottom Wear", "Outer Wear"]
    
    var body: some View {
        VStack(spacing: 24) {
            
            Text("What do you want to wear?")
                .font(.title)
                .multilineTextAlignment(.leading)
                .fontWeight(.bold)
                .padding(.top, 40)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(0..<clothesType.count, id: \.self) { index in
                    CheckboxViewComponent(isChecked: $checkboxStates[index], label: clothesType[index])
                }
            }
            
            
            Spacer()
            
            NavigationLink(destination: SelectClothesItemView()) {
                ButtonViewComponent(title: "Continue", isPrimary: true)
            }
        }
        .padding(.horizontal, 16)
    }
        
}



#Preview {
    SelectClothesTypeView()
}
