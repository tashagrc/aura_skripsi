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
        occasion: "Select Occasion",
        category: "Select Category",
        type: "Select Type",
        color: "Select Color",
        color_code: "#000000",
        pattern: "Select Pattern",
        desc: "Default",
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
                .accessibilityAddTraits(.isHeader) // Marked as a header for screen readers
            
            VStack(alignment: .leading, spacing: 16) {
                Text("How do you want to add your clothes?")
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .accessibilityLabel("How would you like to add your clothes?") // More natural phrasing
                
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "camera.fill")
                        .accessibilityHidden(true) // Decorative image
                    
                    Text("Take Photo: snap a picture for automatic details.")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .accessibilityLabel("Take a photo to automatically capture clothing details.")
                }
                
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "square.and.pencil")
                        .accessibilityHidden(true) // Decorative image
                    
                    Text("Fill In Manually: enter details yourself.")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .accessibilityLabel("Fill in clothing details manually.")
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
                .accessibilityLabel("Take a photo of your clothes") // Improved clarity for VoiceOver
                .confirmationDialog("Select an option", isPresented: $viewModel.showActionSheet) {
                    Button("Pick an Image from Library") {
                        viewModel.showPhotoPicker = true
                    }
                    .accessibilityLabel("Pick an image from your photo library")
                    
                    Button("Take a Photo") {
                        viewModel.showCamera = true
                    }
                    .accessibilityLabel("Take a new photo of your clothes")
                    
                    Button("Cancel", role: .cancel) {}
                }
                
                NavigationLink(destination: ClothesDetailView(
                    viewModel: ClothesDetailViewModel(clothesModel: clothesModel, mode: .add))) {
                    ButtonViewComponent(title: "Fill in Manually", isPrimary: false)
                }
                .accessibilityLabel("Manually enter clothing details")
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
                        var updatedModel = clothesModel
                        updatedModel.imagePath = viewModel.saveImageToDocuments(image: image) ?? ""
                        return updatedModel
                    }(), mode: .add,
                    image: image
                ))
            }
        }
    }
}


#Preview {
    InsertClothesGuideView()
}
