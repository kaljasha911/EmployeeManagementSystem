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
            for employee in employees.values {
                employee.displayDetails()
            }
        }
    }
    func searchEmployee(by id: Int) -> Employee? {
        return employees[id]
    }
}
