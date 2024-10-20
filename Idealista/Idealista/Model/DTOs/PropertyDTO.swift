//
//  PropertyDTO.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

struct PropertyDTO: Codable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let images: [String]
}
