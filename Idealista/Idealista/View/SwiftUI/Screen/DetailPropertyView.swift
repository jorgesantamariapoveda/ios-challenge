//
//  DetailPropertyView.swift
//  Idealista
//
//  Created by Jorge on 23/10/24.
//

import SwiftUI

struct DetailPropertyView: View {
    
    @ObservedObject private var viewModel: DetailPropertyViewModel

    init(viewModel: DetailPropertyViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var showFullComment = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 8) {
                CarruselView(urls: viewModel.representable.imagesUrl)
                DetailPropertySectionView(representable: viewModel.representable)
                DetailPropertyActionButtonsView(viewModel: viewModel)
                DetailPropertyAdvertiserCommentView(
                    representable: viewModel.representable,
                    showFullComment: $showFullComment
                )
                Divider()
                    .padding(.vertical)
                DetailPropertyBasicCharacteristicsView()
                    .environmentObject(viewModel)
                DetailPropertyEnergyCertificationView()
                    .environmentObject(viewModel)
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
        representable: representable,
        getDetailPropertyUseCase: GetDetailPropertyUseCaseMock()
    )
    
    DetailPropertyView(viewModel: viewModel)
}

