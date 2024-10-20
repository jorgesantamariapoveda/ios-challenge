//
//  URLSessionErrorResolver.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

final class URLSessionErrorResolver {
    func resolve(statusCode: Int) -> HTTPClientError {
        guard statusCode < 500 else {
            return .serverError
        }
        return .clientError
    }
}
