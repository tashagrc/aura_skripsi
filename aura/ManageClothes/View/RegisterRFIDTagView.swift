//
//  RegisterRFIDTagView.swift
//  aura
//
//  Created by Natasha Radika on 22/01/25.
//

import SwiftUI

struct RegisterRFIDTagView: View {
    @ObservedObject var viewModel: RegisterRFIDTagViewModel
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Set up your Aura tag")
                .font(.title)
                .multilineTextAlignment(.leading)
                .fontWeight(.bold)
                .padding(.top, 40)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Place the Aura tag on the back of your phone until you hear a beep. Ensure NFC is enabled in your phone settings.")
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding(.top, 16)
            
            Spacer().frame(height: 24)
            
            FindCardViewComponent(itemName: "Aura Tag", status: viewModel.isFound)
            Spacer()
            
            if viewModel.isFound {
                NavigationLink(destination: SuccessView(iconName: "paperclip", title: "Attach the registered Aura tag to the clothes you took photos of earlier", subtitle: "Use sewing, adhesive, or a clip to securely attatch the tag.", returnTab: 1)) {
                    ButtonViewComponent(title: "Continue", isPrimary: true)
                }
            }
            
        }
        .padding(.horizontal, 16)
        .onAppear {
            viewModel.modelContext = modelContext
            viewModel.startTagDetection()
        }
    }
}

