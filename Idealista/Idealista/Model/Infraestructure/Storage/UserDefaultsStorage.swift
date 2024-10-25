//
//  UserDefaultsStorage.swift
//  Idealista
//
//  Created by Jorge on 25/10/24.
//

import Foundation

final class UserDefaultsStorage: StorageProtocol {
    
    private let userDefaults = UserDefaults.standard
    
    func save(value: String, forKey key: String) {
        userDefaults.set(value, forKey: key)
    }
    
    func retrieve(forKey key: String) -> String? {
        return userDefaults.string(forKey: key)
    }
    
    func remove(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
