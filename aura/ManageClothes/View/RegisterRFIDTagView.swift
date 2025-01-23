//
//  RegisterRFIDTagView.swift
//  aura
//
//  Created by Natasha Radika on 22/01/25.
//

import SwiftUI

struct RegisterRFIDTagView: View {
    var isFound: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Set up your Aura tag")
                .font(.title)
                .multilineTextAlignment(.leading)
                .fontWeight(.bold)
                .padding(.top, 40)
            Spacer()
            Text("Place the Aura tag on the back of your phone until you hear a beep. Ensure NFC is enabled in your phone settings.")
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding(.top, 40)
            
            
            FindCardViewComponent(itemName: "Aura Tag", status: false)
            Spacer()
            
            ButtonViewComponent(title: "Continue", destination: SuccessView(iconName: "paperclip", title: "Attach the registered Aura tag to the clothes you took photos of earlier", subtitle: "Use sewing, adhesive, or a clip to securely attatch the tag."), isPrimary: true)
        }
        .padding()
    }
}

#Preview {
    RegisterRFIDTagView()
}
