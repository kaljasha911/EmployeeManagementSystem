//  Author: Jashan Kalsi - 991494313
//  Course: INFO10229 Mobile Computing
//  Date: 2025-06-11
//
//  Employee Management System - Assignment 02
//  Taxable.swift
//  EmpSysJashan

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
