//
//  PropertyApiDataSource.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

protocol PropertyApiDataSource {
    func execute() async throws -> [PropertyDTO]
}

final class PropertyApiDataSourceImpl: PropertyApiDataSource {
    
    func execute() async throws -> [PropertyDTO] {
        return []
    }
}
