//
//  FindClothesView.swift
//  aura
//
//  Created by Natasha Radika on 21/01/25.
//

import SwiftUI

struct FindClothesView: View {
    @StateObject private var viewModel: FindClothesViewModel
    
    init(selectedClothes: [ClothesModel]) {
        _viewModel = StateObject(wrappedValue: FindClothesViewModel(selectedClothes: selectedClothes))
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .center, spacing: 16) {
                    Image(systemName: "tag")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.primary)
                    
                    Text("Scan each Aura Tag on your clothes with your phone until you hear a beep")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding(.top, 40)
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(viewModel.cardData.indices, id: \.self) { index in
                            FindCardViewComponent(
                                itemName: viewModel.cardData[index].title,
                                status: viewModel.cardData[index].status
                            )
                        }
                    }
                    .padding(.top, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                NavigationLink(destination: SuccessView(iconName: "checkmark.circle", title: "Amazing choice!", subtitle: "Pick up all of your selected clothes", returnTab: 0)) {
                    ButtonViewComponent(title: "Continue", isPrimary: true)
                }
            }
            .padding(.horizontal, 16)
            .onAppear {
                viewModel.startScanning() // Start scanning when the view appears
            }
            .onDisappear {
                NFCManager.shared.invalidateSession()
            }
            
            // Toast message overlay for errors
            if let errorMessage = viewModel.errorMessage {
                VStack {
                    Text(errorMessage)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red.opacity(0.8))
                        .cornerRadius(10)
                        .padding(.bottom, 50)
                        .transition(.opacity)
                        .animation(.easeInOut, value: viewModel.errorMessage)
                    Spacer()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        viewModel.errorMessage = nil
                    }
                }
            }
        }
        
    }
}
