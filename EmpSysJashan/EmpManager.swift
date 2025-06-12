//
//  EmpManager.swift
//  EmpSysJashan
//
//  Created by Jashan Kalsi on 2025-06-11.
//

import Foundation

class EmpManager {
    // Using a dictionary where the key is the employee ID for fast lookups
    var employees: [Int: Employee] = [:]

    // Function to add a new employee
    func addEmployee(employee: Employee) {
        employees[employee.id] = employee
        print("✅ Employee added successfully!")
    }

    // Function to display all employees
    func displayAllEmployees() {
        if employees.isEmpty {
            print("No employees to display.")
            return
        }
        print("--- Displaying All Employees ---")
        // Sort by ID for consistent ordering
        for employee in employees.values.sorted(by: { $0.id < $1.id }) {
            employee.displayDetails()
        }
        print("------------------------------")
    }

    // Function to search for an employee by ID
    func searchEmployee(byID id: Int) {
        if let employee = employees[id] {
            print("--- Employee Details ---")
            employee.displayDetails()
            print("------------------------")
        } else {
            print("❌ Employee with ID \(id) not found.")
        }
    }

    // Function to remove an employee by ID
    func removeEmployee(byID id: Int) {
        if employees.removeValue(forKey: id) != nil {
            print("✅ Employee with ID \(id) removed successfully.")
        } else {
            print("❌ Employee with ID \(id) not found.")
        }
    }
}
