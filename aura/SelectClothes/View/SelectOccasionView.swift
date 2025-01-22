//
//  SelectOccasionView.swift
//  aura
//
//  Created by Natasha Radika on 17/01/25.
//

import SwiftUI

struct SelectOccasionView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Where do you want to go?")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                Spacer().frame(height: 20)
                
                ForEach(buttonData, id: \.title) { button in
                    SelectorViewComponent(icon: button.icon, title: button.title, destination: SelectClothesTypeView())
                }
                Spacer()
            }
            .padding()
        }
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
