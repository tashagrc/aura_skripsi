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
                Text("Continue")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top, 20)
            }
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(50)
        .navigationTitle("Clothes Type")
        .navigationBarTitleDisplayMode(.inline)
    }
        
}



#Preview {
    SelectClothesTypeView()
}
