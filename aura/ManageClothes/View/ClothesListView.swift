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
                .accessibilityAddTraits(.isHeader) // Marked as a header
            
            if viewModel.clothes.isEmpty {
                Text("No clothes found.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.top, 16)
                    .accessibilityLabel("No clothes available") // More descriptive for screen readers
                Spacer()
            } else {
                List {
                    ForEach(viewModel.clothes, id: \.id) { clothes in
                        NavigationLink(
                            destination: ClothesDetailView(
                                viewModel: ClothesDetailViewModel(
                                    clothesModel: clothes, mode: .view,
                                    image: ClothesListViewModel.loadImageFromDocuments(imagePath: clothes.imagePath)
                                )
                            )
                        ) {
                            ClothesCardViewComponent(
                                title: clothes.desc,
                                description: "\(clothes.occasion), \(clothes.category), \(clothes.color), \(clothes.pattern)",
                                image: ClothesListViewModel.loadImageFromDocuments(imagePath: clothes.imagePath)
                            )
                            .accessibilityElement(children: .combine) // Combine elements in the card for better readability
                            .accessibilityLabel("\(clothes.desc), \(clothes.occasion), \(clothes.category), \(clothes.color), \(clothes.pattern)") // Better screen reader description
                        }
                    }
                    .onDelete { indexes in
                        for index in indexes {
                            viewModel.deleteClothes(clothes: viewModel.clothes[index], using: modelContext)
                        }
                    }
                    .accessibilityAction(named: "Delete") {
                        if let first = viewModel.clothes.first {
                            viewModel.deleteClothes(clothes: first, using: modelContext)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .padding(.horizontal, 16)
        .onAppear {
            viewModel.fetchData(using: modelContext)
        }
    }
}

