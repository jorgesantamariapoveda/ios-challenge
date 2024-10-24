//
//  DetailPropertyAdvertiserCommentView.swift
//  Idealista
//
//  Created by Jorge on 24/10/24.
//

import SwiftUI

struct DetailPropertyAdvertiserCommentView: View {
    
    let representable: PropertyRepresentable
    @Binding var showFullComment: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Comentario del anunciante")
                .font(.title2)
                .fontWeight(.bold)
            Text(comentario)
                .font(.callout)
                .lineLimit(5)
            ButtonDetailView(title: "Ir al comentario completo") {
                showFullComment.toggle()
            }
        }
    }
}

#Preview {
    let representable = PropertyRepresentableMock.create()
  
    DetailPropertyAdvertiserCommentView(representable: representable, showFullComment: .constant(true))
}
