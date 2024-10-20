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
    private let propertyRepository: PropertyRepository
    
    init(propertyRepository: PropertyRepository) {
        self.propertyRepository = propertyRepository
    }
    
    func execute() async throws -> [Property] {
        try await propertyRepository.fetchAll()
    }
}
