//
//  Date+.swift
//  Idealista
//
//  Created by Jorge on 25/10/24.
//

import Foundation

extension Date {
    
    enum Format: String {
        case dd_yy_mm = "dd/MM/yyyy"
    }
    
    func toString(format: Format) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        
        return formatter.string(from: self)
    }
}
