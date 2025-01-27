//
//  ClothesListView.swift
//  aura
//
//  Created by Natasha Radika on 22/01/25.
//

import SwiftUI
import SwiftData

struct ClothesListView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel: ClothesListViewModel

    init() {
        _viewModel = StateObject(wrappedValue: ClothesListViewModel())
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("My Clothes")
                .font(.title)
                .multilineTextAlignment(.leading)
                .fontWeight(.bold)
                .padding(.top, 40)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView {
                VStack(spacing: 16) {
                    if viewModel.clothes.isEmpty {
                        Text("No clothes found.")
                            .font(.body)
                            .foregroundColor(.gray)
                    } else {
                        ForEach(viewModel.clothes, id: \.id) { clothes in
                            NavigationLink(
                                destination: ClothesDetailView(
                                    viewModel: ClothesDetailViewModel(clothesModel: clothes)
                                )
                            ) {
                                ClothesCardViewComponent(
                                    title: clothes.type,
                                    description: clothes.desc,
                                    imageName: clothes.imagePath
                                )
                            }
                        }
                    }
                }
                .padding(.top, 16)
            }
            Spacer()
        }
        .padding(.horizontal, 16)
        .onAppear {
            viewModel.fetchData(using: modelContext)
        }
    }
}
