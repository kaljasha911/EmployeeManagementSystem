//  Author: Jashan Kalsi - 991494313
//  Course: INFO10229 Mobile Computing
//  Date: 2025-06-12
//  Employee Management System - Assignment 02
//  Employee.swift
//  EmpSysJashan

import Foundation

// Base class representing a generic Employee
class Employee {
    var name: String             // Employee's name
    var id: Int                  // Employee's unique ID
    
    // Computed property for salary, intended to be overridden by subclasses
    var salary: Double {
        return 0.0
    }

    // Initializer to set name and ID
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }

    // Method to display basic employee details (can be overridden)
    func displayDetails() {
        print("Name: \(name), ID: \(id), Salary: \(String(format: "%.2f", salary))")
    }
}

// Subclass representing a full-time employee
class FullTimeEmployee: Employee {
    var monthlySalary: Double   // Monthly salary for full-time employees

    // Override salary to return the fixed monthly salary
    override var salary: Double {
        return monthlySalary
    }

    // Initializer for full-time employee, also calls base initializer
    init(name: String, id: Int, monthlySalary: Double) {
        self.monthlySalary = monthlySalary
        super.init(name: name, id: id)
    }

    // Override to display additional tax info along with details
    override func displayDetails() {
        print("Name: \(name), ID: \(id), Monthly Salary: \(String(format: "%.2f", salary)), Tax: \(String(format: "%.2f", calculateTax()))")
    }
}

// Subclass representing a part-time employee
class PartTimeEmployee: Employee {
    var hourlyRate: Double      // Hourly wage
    var hoursWorked: Int        // Total hours worked

    // Override salary to compute pay based on hours and rate
    override var salary: Double {
        return hourlyRate * Double(hoursWorked)
    }

    // Initializer for part-time employee, also calls base initializer
    init(name: String, id: Int, hourlyRate: Double, hoursWorked: Int) {
        self.hourlyRate = hourlyRate
        self.hoursWorked = hoursWorked
        super.init(name: name, id: id)
    }

    // Override to display salary and tax information
    override func displayDetails() {
        print("Name: \(name), ID: \(id), Salary: \(String(format: "%.2f", salary)), Tax: \(String(format: "%.2f", calculateTax()))")
    }
}
