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
    let apiDataSource: PropertyApiDataSource
    let mapper: PropertyMapper
    
    init(
        apiDataSource: PropertyApiDataSource = PropertyApiDataSourceImpl(),
        mapper: PropertyMapper = PropertyMapperImpl()
    ) {
        self.apiDataSource = apiDataSource
        self.mapper = mapper
    }
    
    func fetchAll() async throws -> [Property] {
        let propertiesDTO = try await apiDataSource.fetchAll()
        return propertiesDTO.map { mapper.map(from: $0) }
    }
}
