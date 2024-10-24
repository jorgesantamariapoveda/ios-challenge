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

final class GetDetailPropertyUseCaseMock: GetDetailPropertyUseCase {
    
    func execute() async throws -> DetailProperty {
        let basicCharacteristics = DetailProperty.BasicCharacteristics(
            communityCosts: 330,
            rooms: 3,
            baths: 2,
            boxroom: true
        )
        
        let energyCertification = DetailProperty.EnergyCertification(
            title: "title",
            energyConsumption: "A",
            emissions: "B"
        )
        
        return DetailProperty(
            description: "",
            latitude: 111,
            longitude: 222,
            basicCharacteristics: basicCharacteristics,
            energyCertification: energyCertification
        )
    }
}
