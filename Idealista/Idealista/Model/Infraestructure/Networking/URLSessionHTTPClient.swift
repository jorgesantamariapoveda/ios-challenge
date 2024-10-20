//
//  URLSessionHTTPClient.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

final class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession
    private let errorResolver: URLSessionErrorResolver
    
    init(
        session: URLSession = .shared,
        errorResolver: URLSessionErrorResolver = .init()
    ) {
        self.session = session
        self.errorResolver = errorResolver
    }
    
    func makeRequest(baseUrl: String, path: String, method: HTTPClientMethod) async throws -> Data {
        let urlComponents = URLComponents(string: baseUrl + path)
        let url = urlComponents?.url
        return try await execute(url: url, method: method)
    }
    
    private func execute(url: URL?, method: HTTPClientMethod) async throws -> Data {
        guard let url = url else {
            throw HTTPClientError.badURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        guard let (data, response) = try? await session.data(for: request) else {
            throw HTTPClientError.genericError
        }
        
        guard let response = response as? HTTPURLResponse else {
            throw HTTPClientError.responseError
        }
        
        guard response.statusCode == 200 else {
            throw errorResolver.resolve(statusCode: response.statusCode)
        }
        
        return data
    }
}
