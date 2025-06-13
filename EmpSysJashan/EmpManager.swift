//
//  EmpManager.swift
//  EmpSysJashan
//
//  Created by Jashan Kalsi on 2025-06-12.
//

import Foundation

// EmpManager class handles storage and management of Employee objects
class EmpManager {
    // Dictionary to store employees with their ID as the key
    var employees: [Int: Employee] = [:]

    // Adds a new employee to the system
    // - Returns: `true` if the employee was added successfully, `false` if an employee with the same ID already exists
    func addEmployee(_ employee: Employee) -> Bool {
        if employees[employee.id] != nil {
            // Employee with this ID already exists
            return false
        } else {
            // Add new employee
            employees[employee.id] = employee
            return true
        }
    }

    // Removes an employee from the system by their ID
    func removeEmployee(by id: Int) {
        employees.removeValue(forKey: id)
    }

    // Displays details of all employees in the system
    func displayAllEmployees() {
        if employees.isEmpty {
            print("No employees to display.")
        } else {
            print("\n--- All Employees ---")
            // Iterate through sorted list of employees by ID
            for employee in employees.values.sorted(by: { $0.id < $1.id }) {
                employee.displayDetails()
            }
            print("---------------------\n")
        }
    }

    // Searches for an employee by their ID
    // - Returns: The employee object if found, or `nil` if not found
    func searchEmployee(by id: Int) -> Employee? {
        return employees[id]
    }
}
