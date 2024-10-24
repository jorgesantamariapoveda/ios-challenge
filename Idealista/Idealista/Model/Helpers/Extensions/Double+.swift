//
//  Double+.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

extension Double {
    
    func formatToCurrencyWithoutCurrencySymbol() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        if let formattedValue = formatter.string(from: NSNumber(value: self)) {
            return formattedValue
        } else {
            return "\(self)"
        }
    }
    
    func formatToCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        
        if let formattedValue = formatter.string(from: NSNumber(value: self)) {
            return formattedValue
        } else {
            return "\(self)"
        }
    }
}
