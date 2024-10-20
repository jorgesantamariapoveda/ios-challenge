//
//  HTTPClientError.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

enum HTTPClientError: Error {
    case parsingError
    case badURL
    case genericError
    case responseError
    case serverError
    case clientError
}
