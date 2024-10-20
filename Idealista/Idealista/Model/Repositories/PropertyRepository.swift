//
//  PropertyRepository.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

protocol PropertyRepository {
    func fetchAll() async throws -> [Property]
}

final class PropertyRepositoryImpl: PropertyRepository {
    let propertyApiDataSource: PropertyApiDataSource
    let propertyMapper: PropertyMapper
    
    init(
        propertyApiService: PropertyApiDataSource,
        propertyMapper: PropertyMapper
    ) {
        self.propertyApiDataSource = propertyApiService
        self.propertyMapper = propertyMapper
    }
    
    func fetchAll() async throws -> [Property] {
        let propertiesDTO = try await propertyApiDataSource.execute()
        return propertiesDTO.map { propertyMapper.map(from: $0) }
    }
}
