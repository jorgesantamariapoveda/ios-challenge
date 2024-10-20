//
//  HTTPClient.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

protocol HTTPClient {
    func makeRequest(baseUrl: String, path: String, method: HTTPClientMethod) async throws -> Data
}
