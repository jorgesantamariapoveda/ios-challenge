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
                DetailPropertyEnergyCertificationView()
            }
            .frame(maxWidth: .infinity)
        }
        .sheet(isPresented: $showFullComment) {
            DetailPropertyAdvertiserFullCommentView()
        }
        .padding()
    }
}

#Preview {
    let property = Property(
        id: "1",
        imagesUrl: [
            "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/58/60/32/1273036727.webp",
            "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/a1/0f/ee/1273036728.webp",
            "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/79/6b/e0/1273036729.webp",
            "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/00/c5/91/1273036730.webp",
        ],
        address: "calle de Lagasca".capitalizeFirstWord(),
        priceAmount: 1195000.0,
        priceCurrencySuffix: "€",
        isParkingSpaceIncludedInPrice: true,
        rooms: 3,
        size: 133.0
    )
    
    let representable = PropertyRepresentable(domainModel: property)
    let viewModel = DetailPropertyViewModel(getDetailPropertyUseCase: GetDetailPropertyUseCaseMock())
    
    DetailPropertyView(
        representable: representable,
        viewModel: viewModel
    )
}

