//
//  DetailPropertyApiDataSource.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

protocol DetailPropertyApiDataSource {
    func fetchAll() async throws -> DetailPropertyDTO
}

final class DetailPropertyApiDataSourceImpl: DetailPropertyApiDataSource {
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient = URLSessionHTTPClient()) {
        self.httpClient = httpClient
    }
    
    func fetchAll() async throws -> DetailPropertyDTO {
        let data = try await httpClient.makeRequest(
            baseUrl: Constants.API.baseURL,
            path: "detail.json",
            method: .get
        )
        
        guard let result = try? JSONDecoder().decode(DetailPropertyDTO.self, from: data) else {
            throw HTTPClientError.parsingError
        }

        return result
    }
}
