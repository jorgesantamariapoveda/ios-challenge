//
//  DetailPropertyActionButtonsView.swift
//  Idealista
//
//  Created by Jorge on 24/10/24.
//

import SwiftUI

struct DetailPropertyActionButtonsView: View {
    
    let representable: PropertyRepresentable
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            ButtonDetailView(title: "Guardar", systemName: "heart") {
                print("limit::")
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
    }
}

#Preview {
    let representable = PropertyRepresentableMock.create()
    
    DetailPropertyActionButtonsView(representable: representable)
}
