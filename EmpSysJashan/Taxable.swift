//  Author: Jashan Kalsi - 991494313
//  Course: INFO10229 Mobile Computing
//  Date: 2025-06-11
//
//  Employee Management System - Assignment 02
//  Taxable.swift
//  EmpSysJashan

import Foundation

// A protocol that requires conforming types to implement a method to calculate tax.
protocol Taxable {
    func calculateTax() -> Double
}

// Extension to add tax calculation for full-time employees.
// Full-time employees are taxed at 20% of their salary.
extension FullTimeEmployee: Taxable {
    func calculateTax() -> Double {
        return salary * 0.20
    }
}

// Extension to add tax calculation for part-time employees.
// Part-time employees are taxed at 10% of their salary.
extension PartTimeEmployee: Taxable {
    func calculateTax() -> Double {
        return salary * 0.10
    }
}
