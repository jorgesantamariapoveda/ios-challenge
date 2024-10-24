//
//  CarruselView.swift
//  Idealista
//
//  Created by Jorge on 23/10/24.
//

import SwiftUI

struct CarruselView: View {
    let urls: [String]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 5) {
                ForEach(0..<urls.count, id: \.self) { index in
                    AsyncImage(url: URL(string: urls[index])) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 200)
                }
            }
        }
    }
}

#Preview {
    let urls: [String] = [
        "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/f4/0d/ce/1271132815.webp",
        "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/f4/0d/ce/1271132815.webp",
        "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/f4/0d/ce/1271132815.webp",
    ]
    CarruselView(urls: urls)
}
