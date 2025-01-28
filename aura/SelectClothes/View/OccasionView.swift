//
//  SelectOccasionView.swift
//  aura
//
//  Created by Natasha Radika on 17/01/25.
//

import SwiftUI

struct OccasionView: View {
    @StateObject private var occasionViewModel = OccasionViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("Where do you want to go?")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: 16) {
                    ForEach(buttonData, id: \.title) { button in
                        NavigationLink(destination: {
                            let clothesTypeViewModel = ClothesTypeViewModel(selectedOccasion: button.title)
                            ClothesTypeView(viewModel: clothesTypeViewModel)
                        }) {
                            SelectorViewComponent(icon: button.icon, title: button.title)
                                .simultaneousGesture(
                                    TapGesture().onEnded {
                                        occasionViewModel.selectedOccasion = button.title
                                    }
                                )
                        }
                        
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
    OccasionView()
}
