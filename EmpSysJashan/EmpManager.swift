//
//  EmpManager.swift
//  EmpSysJashan
//
//  Created by Jashan Kalsi on 2025-06-12.
//
import Foundation

// EmpManager class
class EmpManager {
    var employees: [Int: Employee] = [:]
    func addEmployee(_ employee: Employee) -> Bool {
        if employees[employee.id] != nil {
            return false
        } else {
            employees[employee.id] = employee
            return true
        }
    }
    func removeEmployee(by id: Int) {
        employees.removeValue(forKey: id)
    }
    func displayAllEmployees() {
        if employees.isEmpty {
            print("No employees to display.")
        } else {
            print("\n--- All Employees ---")
            // The .values property returns a collection of the dictionary's values.
            // .sorted sorts the employees by their ID for a consistent display order.
            for employee in employees.values.sorted(by: { $0.id < $1.id }) {
                employee.displayDetails()
            }
            print("---------------------\n")
        }
    }
    func searchEmployee(by id: Int) -> Employee? {
        return employees[id]
    }
}
