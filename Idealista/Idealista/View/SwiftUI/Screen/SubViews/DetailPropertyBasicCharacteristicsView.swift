//
//  DetailPropertyBasicCharacteristicsView.swift
//  Idealista
//
//  Created by Jorge on 24/10/24.
//

import SwiftUI

struct DetailPropertyBasicCharacteristicsView: View {
    
    @EnvironmentObject private var viewModel: DetailPropertyViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Características básicas")
                .font(.title2)
                .fontWeight(.bold)
            
            switch viewModel.state {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView()
            case .loaded:
                if let representable = viewModel.detailPropertyRepresentable {
                    Text(representable.baths)
                        .font(.callout)
                    Text(representable.rooms)
                        .font(.callout)
                    if let boxroom = representable.boxroom {
                        Text(boxroom)
                            .font(.callout)
                    }
                }
                
            case .error:
                Text("Error")
            }
        }
    }
}
