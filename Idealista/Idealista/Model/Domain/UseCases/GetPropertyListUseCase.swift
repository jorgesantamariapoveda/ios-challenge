//
//  GetPropertyListUseCase.swift
//  Idealista
//
//  Created by Jorge on 19/10/24.
//

import Foundation

protocol GetPropertyListUseCase {
    func execute() async throws -> [Property]
}

final class GetPropertyListUseCaseImpl: GetPropertyListUseCase {
    private let repository: PropertyRepository
    
    init(repository: PropertyRepository = PropertyRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute() async throws -> [Property] {
        try await repository.fetchAll()
    }
}
