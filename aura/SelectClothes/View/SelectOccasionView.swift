//
//  SelectOccasionView.swift
//  aura
//
//  Created by Natasha Radika on 17/01/25.
//

import SwiftUI

struct SelectOccasionView: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("Where do you want to go?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                ForEach(buttonData, id: \.title) { button in
                    NavigationLink(destination: SelectClothesTypeView()) {
                        SelectorViewComponent(icon: button.icon, title: button.title)
                    }
                    
                }
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ButtonData {
    let icon: String
    let title: String
}

let buttonData: [ButtonData] = [
    ButtonData(icon: "bag", title: "Work"),
    ButtonData(icon: "person.2", title: "Hangout"),
    ButtonData(icon: "basketball", title: "Exercise"),
    ButtonData(icon: "capsule", title: "Streetwear"),
    ButtonData(icon: "questionmark", title: "Other"),
]

#Preview {
    SelectOccasionView()
}
