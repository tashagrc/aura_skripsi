//
//  TakePhotoGuideView.swift
//  aura
//
//  Created by Natasha Radika on 22/01/25.
//

import SwiftUI
import PhotosUI

struct InsertClothesGuideView: View {
    @StateObject private var viewModel = InsertClothesViewModel()
    
    let clothesModel = ClothesModel(
        id: UUID().uuidString,
        rfid_id: "",
        occasion: "Formal",
        category: "Outerwear",
        type: "Blazer",
        color: "Black",
        color_code: "#000000",
        pattern: "Solid",
        desc: "Black Blazer",
        imagePath: ""
    )
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Insert a clothes")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 40)
            
            VStack(alignment: .leading, spacing: 16) {
                Text("How do you want to add your clothes?")
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "camera.fill")
                    Text("Take Photo: snap a picture for automatic details.")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                }
                
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "square.and.pencil")
                    Text("Fill In Manually: enter details yourself.")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(.top, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            VStack(spacing: 16) {
                
                Button(action: {
                    viewModel.showActionSheet = true
                }) {
                    ButtonViewComponent(title: "Take Photo", isPrimary: true)
                }
                .confirmationDialog("Select an option", isPresented: $viewModel.showActionSheet) {
                    Button("Pick an Image from Library") {
                        viewModel.showPhotoPicker = true
                    }
                    Button("Take a Photo") {
                        viewModel.showCamera = true
                    }
                    Button("Cancel", role: .cancel) {}
                }
                NavigationLink(destination: ClothesDetailView(
                    viewModel: ClothesDetailViewModel(clothesModel: clothesModel))) {
                    ButtonViewComponent(title: "Fill in Manually", isPrimary: false)
                }
            }
            
        }
        .padding(.horizontal, 16)
        .fullScreenCover(isPresented: $viewModel.showCamera) {
            CameraView(selectedImage: $viewModel.selectedImage, navigateToImage: $viewModel.navigateToImage)
        }
        .photosPicker(isPresented: $viewModel.showPhotoPicker, selection: $viewModel.selectedItem, matching: .images)
        .onChange(of: viewModel.selectedItem) { _ in
            Task {
                if let data = try? await viewModel.selectedItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    viewModel.selectedImage = uiImage
                    viewModel.navigateToImage = true
                }
            }
        }
        .navigationDestination(isPresented: $viewModel.navigateToImage) {
            if let image = viewModel.selectedImage {
                ClothesDetailView(viewModel: ClothesDetailViewModel(
                    clothesModel: {
                        let updatedModel = clothesModel
                        updatedModel.imagePath = viewModel.saveImageToDocuments(image: image) ?? ""
                        return updatedModel
                    }(),
                    image: image
                ))
            }
        }
    }
}

#Preview {
    InsertClothesGuideView()
}
