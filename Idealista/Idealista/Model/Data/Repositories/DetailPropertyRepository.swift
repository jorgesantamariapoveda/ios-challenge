//
//  DetailPropertyRepository.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

protocol DetailPropertyRepository {
    func fetch() async throws -> DetailProperty
}

final class DetailPropertyRepositoryImpl: DetailPropertyRepository {
    let apiDataSource: DetailPropertyApiDataSource
    let mapper: DetailPropertyMapper
    
    init(
        apiDataSource: DetailPropertyApiDataSource = DetailPropertyApiDataSourceImpl(),
        mapper: DetailPropertyMapper = DetailPropertyMapperImpl()
    ) {
        self.apiDataSource = apiDataSource
        self.mapper = mapper
    }
    
    func fetch() async throws -> DetailProperty {
        let propertyDTO = try await apiDataSource.fetchAll()
        return mapper.map(from: propertyDTO)
    }
}
