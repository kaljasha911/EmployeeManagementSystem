//
//  Taxable.swift
//  EmpSysJashan
//
//  Created by Jashan Kalsi on 2025-06-12.
//

import Foundation

// Taxable protocol
protocol Taxable {
    func calculateTax() -> Double
}

// Extensions to conform to Taxable
extension FullTimeEmployee: Taxable {
    func calculateTax() -> Double {
        return salary * 0.20
    }
}

extension PartTimeEmployee: Taxable {
    func calculateTax() -> Double {
        return salary * 0.10
    }
}
