//
//  StorageProtocol.swift
//  Idealista
//
//  Created by Jorge on 25/10/24.
//

import Foundation

protocol StorageProtocol {
    func save(value: String, forKey key: String)
    func retrieve(forKey key: String) -> String?
    func remove(forKey key: String)
}
