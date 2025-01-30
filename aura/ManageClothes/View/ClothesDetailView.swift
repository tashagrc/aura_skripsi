//
//  ClothesDetailView.swift
//  aura
//
//  Created by Natasha Radika on 22/01/25.
//

import SwiftUI

struct ClothesDetailView: View {
    @ObservedObject var viewModel: ClothesDetailViewModel
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack(spacing: 24) {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .cornerRadius(12)
                    .shadow(radius: 4)
                    .accessibilityHidden(true) // Decorative image
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.gray.opacity(0.5))
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                    .shadow(radius: 4)
                    .accessibilityHidden(true) // Decorative placeholder
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
                            if viewModel.mode == .view {
                                viewModel.saveChangesIfNeeded()
                            }
                        }
                        .accessibilityLabel("Title input field")
                } else {
                    Text(viewModel.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .onTapGesture {
                            viewModel.isEditing = true
                        }
                        .accessibilityAddTraits(.isHeader)
                }
                
                Button(action: {
                    viewModel.isEditing.toggle()
                    if viewModel.mode == .view && !viewModel.isEditing {
                        viewModel.saveChangesIfNeeded()
                    }
                }) {
                    Image(systemName: viewModel.isEditing ? "checkmark" : "pencil")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                .buttonStyle(.borderless)
                .accessibilityLabel(viewModel.isEditing ? "Save title" : "Edit title")
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
                        .accessibilityLabel("\(key) label")
                    
                    if let pickerData = viewModel.pickerData[key] {
                        Picker(key, selection: binding) {
                            ForEach(pickerData, id: \.self) { value in
                                Text(value).tag(value)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .onChange(of: binding.wrappedValue) { _ in
                            viewModel.prepareForNextPage()
                            if viewModel.mode == .view {
                                viewModel.saveChangesIfNeeded()
                            }
                        }
                        .accessibilityLabel("\(key) selection")
                    } else {
                        TextField("Enter \(key)", text: binding)
                            .textFieldStyle(.roundedBorder)
                            .onChange(of: binding.wrappedValue) { _ in
                                viewModel.prepareForNextPage()
                                if viewModel.mode == .view {
                                    viewModel.saveChangesIfNeeded()
                                }
                            }
                            .accessibilityLabel("\(key) input field")
                    }
                }
            }
            .padding(.horizontal, 16)
            
            Spacer()
            
            if viewModel.mode == .add {
                NavigationLink(
                    destination: RegisterRFIDTagView(
                        viewModel: RegisterRFIDTagViewModel(clothesModel: viewModel.clothesModel)
                    )
                ) {
                    ButtonViewComponent(title: "Continue", isPrimary: true)
                }
                .accessibilityLabel("Continue to RFID registration")
            }
        }
        .padding(.horizontal, 16)
        .onAppear() {
            viewModel.prepareForNextPage()
            viewModel.modelContext = modelContext
        }
    }
}
