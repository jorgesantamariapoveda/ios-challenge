//
//  DetailPropertySectionView.swift
//  Idealista
//
//  Created by Jorge on 24/10/24.
//

import SwiftUI

struct DetailPropertySectionView: View {
    
    let representable: PropertyRepresentable
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(representable.address)
                .font(.body)
                .fontWeight(.semibold)
            Text(representable.price)
                .font(.title2)
                .fontWeight(.bold)
            
            HStack {
                Text(representable.rooms)
                Text(representable.size)
            }
            .font(.caption)
            .padding(.bottom, 8)
        }
    }
}

#Preview {
    let representable = PropertyRepresentableMock.create()
    
    DetailPropertySectionView(representable: representable)
}
