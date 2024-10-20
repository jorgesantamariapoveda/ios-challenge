//
//  PropertyDTO.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

struct PropertyDTO: Codable { //!! Review 🔴 poner propiedades reales para poder hacer el mapper
    let id: Int
    let title: String
    let description: String
    let price: Double
    let images: [String]
}
