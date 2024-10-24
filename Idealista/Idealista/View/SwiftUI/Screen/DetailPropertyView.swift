//
//  DetailPropertyView.swift
//  Idealista
//
//  Created by Jorge on 23/10/24.
//

import SwiftUI

struct DetailPropertyView: View {
    
    @ObservedObject private var viewModel: DetailPropertyViewModel
    private let representable: PropertyRepresentable

    init(
        representable: PropertyRepresentable,
        viewModel: DetailPropertyViewModel
    ) {
        self.representable = representable
        self.viewModel = viewModel
    }
    
    @State private var showFullComment = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                CarruselView(urls: representable.imagesUrl)
                DetailPropertySectionView(representable: representable)
                DetailPropertyActionButtonsView(representable: representable)
                DetailPropertyAdvertiserCommentView(
                    representable: representable,
                    showFullComment: $showFullComment
                )
                DetailPropertyBasicCharacteristicsView()
                    .environmentObject(viewModel)
                DetailPropertyEnergyCertificationView()
            }
            .frame(maxWidth: .infinity)
        }
        .sheet(isPresented: $showFullComment) {
            DetailPropertyAdvertiserFullCommentView()
        }
        .padding()
        .onAppear {
            viewModel.getDetailProperty()
        }
    }
}

#Preview {
    let representable = PropertyRepresentableMock.create()
    
    let viewModel = DetailPropertyViewModel(
        getDetailPropertyUseCase: GetDetailPropertyUseCaseMock()
    )
    
    DetailPropertyView(
        representable: representable,
        viewModel: viewModel
    )
}

