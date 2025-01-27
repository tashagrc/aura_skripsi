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
                    TextField("Enter Title", text: $viewModel.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .textFieldStyle(.roundedBorder)
                        .submitLabel(.done)
                        .onSubmit {
                            viewModel.isEditing = false
                        }
                } else {
                    Text(viewModel.title)
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
            .background(viewModel.isEditing ? Color(.systemGray6) : Color.clear)
            .cornerRadius(8)
            .animation(.easeInOut, value: viewModel.isEditing)
            
            LazyVGrid(columns: viewModel.columns, spacing: 12) {
                ForEach(viewModel.fields, id: \.0) { key, binding in
                    Text(key)
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    if let pickerData = viewModel.pickerData[key] {
                        Picker(key, selection: binding) {
                            ForEach(pickerData, id: \.self) { value in
                                Text(value).tag(value)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    } else {
                        TextField("Enter \(key)", text: binding)
                            .textFieldStyle(.roundedBorder)
                    }
                }
            }
            .padding(.horizontal, 16)
            
            Spacer()
            
            NavigationLink(
                destination: RegisterRFIDTagView(
                    viewModel: RegisterRFIDTagViewModel(clothesModel: viewModel.clothesModel)
                )
            ) {
                ButtonViewComponent(title: "Continue", isPrimary: true)
            }
            .onAppear {
                viewModel.prepareForNextPage()
            }
        }
        .padding(.horizontal, 16)
    }
}

