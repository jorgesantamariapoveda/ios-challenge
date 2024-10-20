//
//  GetDetailPropertyUseCase.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

protocol GetDetailPropertyUseCase {
    func execute() async throws -> DetailProperty
}

final class GetDetailPropertyUseCaseImpl: GetDetailPropertyUseCase {
    private let repository: DetailPropertyRepository
    
    init(repository: DetailPropertyRepository = DetailPropertyRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute() async throws -> DetailProperty {
        try await repository.fetch()
    }
}
