//
//  RegisterRFIDTagView.swift
//  aura
//
//  Created by Natasha Radika on 22/01/25.
//

import SwiftUI
import AVFoundation

struct RegisterRFIDTagView: View {
    @ObservedObject var viewModel: RegisterRFIDTagViewModel
    @Environment(\.modelContext) var modelContext

    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                Text("Set up your Aura tag")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 40)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .accessibilityAddTraits(.isHeader)

                Text("Place the Aura tag on the back of your phone until you hear a beep. Make sure NFC is enabled in settings.")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 8)

                Spacer().frame(height: 24)

                FindCardViewComponent(itemName: "Aura Tag", status: viewModel.isFound)

                Spacer()

                if viewModel.isFound {
                    NavigationLink(
                        destination: SuccessView(
                            iconName: "paperclip",
                            title: "Attach the registered Aura tag",
                            subtitle: "Secure the tag using sewing, adhesive, or a clip.",
                            returnTab: 1
                        )
                    ) {
                        ButtonViewComponent(title: "Continue", isPrimary: true)
                    }
                    .transition(.opacity)
                    .animation(.easeInOut, value: viewModel.isFound)
                }
            }
            .padding(.horizontal, 16)
            .onAppear {
                viewModel.modelContext = modelContext
                viewModel.startTagDetection()
            }
            .onDisappear {
                NFCManager.shared.invalidateSession()
            }

            // Error message toast
            if let errorMessage = viewModel.errorMessage {
                VStack {
                    Spacer()
                    Text(errorMessage)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red.opacity(0.8))
                        .cornerRadius(10)
                        .padding(.bottom, 50)
                        .transition(.opacity)
                        .animation(.easeInOut, value: viewModel.errorMessage)
                }
                .onAppear {
                    // Play warning sound
                    AudioServicesPlaySystemSound(1322) // System warning sound

                    // Announce the error message via VoiceOver
                    UIAccessibility.post(notification: .announcement, argument: errorMessage)

                    // Hide error message after 2 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            viewModel.errorMessage = nil
                        }
                    }
                }
            }
        }
    }
}

