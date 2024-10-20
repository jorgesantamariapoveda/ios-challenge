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
