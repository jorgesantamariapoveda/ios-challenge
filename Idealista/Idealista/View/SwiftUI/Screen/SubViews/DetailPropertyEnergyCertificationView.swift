//
//  DetailPropertyEnergyCertificationView.swift
//  Idealista
//
//  Created by Jorge on 24/10/24.
//

import SwiftUI

struct DetailPropertyEnergyCertificationView: View {
    
    @EnvironmentObject private var viewModel: DetailPropertyViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Certificado energético")
                .font(.title2)
                .fontWeight(.bold)
            
            switch viewModel.state {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView()
            case .loaded:
                if let representable = viewModel.detailPropertyRepresentable {
                    Text(representable.energyConsumption)
                        .font(.callout)
                    Text(representable.emissions)
                        .font(.callout)
                }
            case .error:
                Text("Error")
            }
        }
    }
}

#Preview {
    DetailPropertyEnergyCertificationView()
}
