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
        VStack(alignment: .leading, spacing: 20) {
            
            Text("What do you want to wear?")
                .font(.title)
                .fontWeight(.bold)
            
            ForEach(0..<3, id: \.self) { index in
                CheckboxViewComponent(isChecked: $checkboxStates[index], label: clothesType[index])
            }
            
            Spacer()
            
            NavigationLink(destination: SelectClothesItemView()) {
                ButtonViewComponent(title: "Continue", isPrimary: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(50)
    }
        
}



#Preview {
    SelectClothesTypeView()
}
