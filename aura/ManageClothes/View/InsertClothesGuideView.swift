//
//  TakePhotoGuideView.swift
//  aura
//
//  Created by Natasha Radika on 22/01/25.
//

import SwiftUI
import PhotosUI

struct InsertClothesGuideView: View {
    @State private var showActionSheet = false
    @State private var showCamera = false
    @State private var showPhotoPicker = false
    @State private var selectedImage: UIImage?
    @State private var selectedItem: PhotosPickerItem?
    @State private var navigateToImage = false
    
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
                    showActionSheet = true
                }) {
                    ButtonViewComponent(title: "Take Photo", isPrimary: true)
                }
                .confirmationDialog("Select an option", isPresented: $showActionSheet) {
                    Button("Pick an Image from Library") {
                        showPhotoPicker = true
                    }
                    Button("Take a Photo") {
                        showCamera = true
                    }
                    Button("Cancel", role: .cancel) {}
                }
                NavigationLink(destination: ClothesDetailView(isNext: true)) {
                    ButtonViewComponent(title: "Fill in Manually", isPrimary: false)
                }
            }
            
        }
        .padding(.horizontal, 16)
        .fullScreenCover(isPresented: $showCamera) {
            CameraView(selectedImage: $selectedImage, navigateToImage: $navigateToImage)
        }
        .photosPicker(isPresented: $showPhotoPicker, selection: $selectedItem, matching: .images)
        .onChange(of: selectedItem) { _ in
            Task {
                if let data = try? await selectedItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                    navigateToImage = true
                }
            }
        }
        .navigationDestination(isPresented: $navigateToImage) {
            if let image = selectedImage {
                ClothesDetailView(image: image)
            }
        }
    }
}

#Preview {
    InsertClothesGuideView()
}
