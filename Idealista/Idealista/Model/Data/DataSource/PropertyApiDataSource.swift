//
//  PropertyApiDataSource.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

protocol PropertyApiDataSource {
    func fetchAll() async throws -> [PropertyDTO]
}

final class PropertyApiDataSourceImpl: PropertyApiDataSource {
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient = URLSessionHTTPClient()) {
        self.httpClient = httpClient
    }
    
    func fetchAll() async throws -> [PropertyDTO] {
        let data = try await httpClient.makeRequest(
            baseUrl: Constants.API.baseURL,
            path: "list.json",
            method: .get
        )
        
        guard let result = try? JSONDecoder().decode([PropertyDTO].self, from: data) else {
            throw HTTPClientError.parsingError
        }

        return result
    }
}
