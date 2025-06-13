//  Author: Jashan Kalsi - 991494313
//  Course: INFO10229 Mobile Computing
//  Date: 2025-06-11
//
//  main.swift
//  Employee Management System - Assignment 02
//

import Foundation

// Main function for console interface
func main() {
    let manager = EmpManager()
    var choice: Int

    repeat {
        print("\nEmployee Management System")
        print("1. Add full-time employee")
        print("2. Add part-time employee")
        print("3. Display all employees")
        print("4. Remove employee by ID")
        print("5. Search for employee by ID")
        print("6. Exit")
        print("Enter your choice: ", terminator: "")

        if let input = readLine(), let option = Int(input) {
            choice = option
            switch choice {
            case 1:
                print("Enter name: ", terminator: "")
                let name = readLine() ?? ""
                print("Enter ID: ", terminator: "")
                let id = Int(readLine() ?? "") ?? 0
                print("Enter monthly salary: ", terminator: "")
                let salary = Double(readLine() ?? "") ?? 0.0
                let employee = FullTimeEmployee(name: name, id: id, monthlySalary: salary)
                if manager.addEmployee(employee) {
                    print("Full-time employee added successfully.")
                } else {
                    print("ID already exists. Employee not added.")
                }

            case 2:
                print("Enter name: ", terminator: "")
                let name = readLine() ?? ""
                print("Enter ID: ", terminator: "")
                let id = Int(readLine() ?? "") ?? 0
                print("Enter hourly rate: ", terminator: "")
                let rate = Double(readLine() ?? "") ?? 0.0
                print("Enter hours worked: ", terminator: "")
                let hours = Int(readLine() ?? "") ?? 0
                let employee = PartTimeEmployee(name: name, id: id, hourlyRate: rate, hoursWorked: hours)
                if manager.addEmployee(employee) {
                    print("Part-time employee added successfully.")
                } else {
                    print("ID already exists. Employee not added.")
                }

            case 3:
                manager.displayAllEmployees()
                
            case 4:
                print("Enter ID to remove: ", terminator: "")
                if let id = Int(readLine() ?? "") {
                    manager.removeEmployee(by: id)
                    print("Employee removed if existed.")
                } else {
                    print("Invalid ID.")
                }

            case 5:
                print("Enter ID to search: ", terminator: "")
                if let id = Int(readLine() ?? ""), let employee = manager.searchEmployee(by: id) {
                    employee.displayDetails()
                } else {
                    print("Employee not found.")
                }

            case 6:
                print("Exiting...")
            default:
                print("Invalid choice. Please try again.")
            }

        } else {
            choice = 0
            print("Invalid input. Please enter a number.")
        }
    } while choice != 6
}

// Call the main function
main()
