//
//  ButtonDetailView.swift
//  Idealista
//
//  Created by Jorge on 23/10/24.
//

import SwiftUI

struct ButtonDetailView: View {
    let title: String
    var systemName: String? = nil
    let action: () -> Void
    
    enum Constants {
        static let size: CGFloat = 16
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                if let systemName {
                    Image(systemName: systemName)
                        .resizable()
                        .frame(width: Constants.size, height: Constants.size)
                }
                Text(title)
                    .font(.callout)
            }
            .foregroundStyle(.idealistaPurple)
        }
    }
}

#Preview {
    HStack {
        Spacer()
        ButtonDetailView(title: "Text button") {
            print("limit::")
        }
        Spacer()
        ButtonDetailView(title: "Classic button", systemName: "heart") {
            print("limit::")
        }
        Spacer()
    }
}
