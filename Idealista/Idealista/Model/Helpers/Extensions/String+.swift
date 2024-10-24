//
//  String+.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

extension String {
    
    func capitalizeFirstWord() -> String {
        var words = self.components(separatedBy: " ")
        
        if let firstWord = words.first {
            words[0] = firstWord.capitalized
        }
        
        return words.joined(separator: " ")
    }
}
