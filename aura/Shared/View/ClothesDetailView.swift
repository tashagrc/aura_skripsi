//
//  ClothesDetailView.swift
//  aura
//
//  Created by Natasha Radika on 22/01/25.
//

import SwiftUI

struct ClothesDetailView: View {
    @ObservedObject var viewModel: ClothesDetailViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(12)
            }
            
            HStack {
                if viewModel.isEditing {
                    TextField("Enter text", text: $viewModel.text)
                        .font(.title)
                        .fontWeight(.bold)
                        .textFieldStyle(.roundedBorder)
                        .submitLabel(.done)
                        .onSubmit {
                            viewModel.isEditing = false
                        }
                } else {
                    Text(viewModel.text)
                        .font(.title)
                        .fontWeight(.bold)
                        .onTapGesture {
                            viewModel.isEditing = true
                        }
                }
                
                Button(action: {
                    viewModel.isEditing.toggle()
                }) {
                    Image(systemName: viewModel.isEditing ? "checkmark" : "pencil")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                .buttonStyle(.borderless)
            }
            .padding()
            .background(viewModel.isEditing ? Color(.systemGray6) : Color.clear) // Subtle background when editing
            .cornerRadius(8)
            .animation(.easeInOut, value: viewModel.isEditing)
            
            LazyVGrid(columns: viewModel.columns, spacing: 12) {
                ForEach(viewModel.data, id: \.0) { key, value in
                    Text(key)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Picker("Select a paint color", selection: $viewModel.selection) {
                        ForEach(viewModel.colors, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
            }
            .padding(.horizontal, 16)
           
            
            Spacer()
            
            if viewModel.isNext {
                NavigationLink(destination: RegisterRFIDTagView(viewModel: RegisterRFIDTagViewModel())) {
                    ButtonViewComponent(title: "Continue", isPrimary: true)
                }
                
            }
            
        }
        .padding(.horizontal, 16)
        
    }
}
