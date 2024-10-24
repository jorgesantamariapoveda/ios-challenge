//
//  DetailPropertyActionButtonsView.swift
//  Idealista
//
//  Created by Jorge on 24/10/24.
//

import SwiftUI

struct DetailPropertyActionButtonsView: View {
    
    @ObservedObject private var viewModel: DetailPropertyViewModel
    
    init(viewModel: DetailPropertyViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Spacer()
                ButtonDetailView(title: "Guardar", systemName: viewModel.isFavourite ? "heart.fill" : "heart") {
                    withAnimation {
                        viewModel.toggleFavourite()
                    }
                }
                Spacer()
                ButtonDetailView(title: "Descartar", systemName: "trash") {
                    print("limit::")
                }
                Spacer()
                ButtonDetailView(title: "Compartir", systemName: "square.and.arrow.up") {
                    print("limit::")
                }
                Spacer()
            }
            
            if let favouriteDate = viewModel.getFavouriteDate() {
                Text("Guardado el \(favouriteDate)")
                    .font(.callout)
                    .padding()
                    .background(.idealistaPurple)
                    .foregroundColor(.white)
                    .cornerRadius(16)
            }
        }
        .onAppear {
            viewModel.checkIfFavourite()
        }
    }
}
