//
//  ClothesDetailView.swift
//  aura
//
//  Created by Natasha Radika on 22/01/25.
//

import SwiftUI

struct ClothesDetailView: View {
    var isNext: Bool = false
    @State private var text: String = "Red T-shirt"
    @State private var isEditing: Bool = false
    
    let data = [
        ("Type", "T-shirt"),
        ("Category", "Top"),
        ("Color", "Yellow"),
        ("Pattern", "Polka dot"),
        ("Occasion", "Casual")
    ]
    
    let columns = [
        GridItem(.fixed(120), alignment: .leading),
        GridItem(.flexible(), alignment: .leading),
    ]
    
    @State private var selection = "T-Shirt"
    let colors = ["T-Shirt", "Green", "Blue", "Black", "Tartan"]
    
    var image: UIImage?
    
    var body: some View {
        VStack(spacing: 24) {
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(12)
            }
            
            HStack {
                if isEditing {
                    TextField("Enter text", text: $text)
                        .font(.title)
                        .fontWeight(.bold)
                        .textFieldStyle(.roundedBorder)
                        .submitLabel(.done)
                        .onSubmit {
                            isEditing = false
                        }
                } else {
                    Text(text)
                        .font(.title)
                        .fontWeight(.bold)
                        .onTapGesture {
                            isEditing = true
                        }
                }
                
                Button(action: {
                    isEditing.toggle()
                }) {
                    Image(systemName: isEditing ? "checkmark" : "pencil")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                .buttonStyle(.borderless)
            }
            .padding()
            .background(isEditing ? Color(.systemGray6) : Color.clear) // Subtle background when editing
            .cornerRadius(8)
            .animation(.easeInOut, value: isEditing)
            
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(data, id: \.0) { key, value in
                    Text(key)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Picker("Select a paint color", selection: $selection) {
                        ForEach(colors, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
            }
            .padding(.horizontal, 16)
           
            
            Spacer()
            
            if isNext {
                NavigationLink(destination: RegisterRFIDTagView()) {
                    ButtonViewComponent(title: "Continue", isPrimary: true)
                }
                
            }
            
        }
        .padding(.horizontal, 16)
        
    }
}

#Preview {
    ClothesDetailView()
}
