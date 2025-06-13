//  Author: Jashan Kalsi - 991494313
//  Course: INFO10229 Mobile Computing
//  Date: 2025-06-11
//  File: main.swift
//
//  Assignment: Employee Management System - Assignment 02

import Foundation

func readString(prompt: String) -> String {
    while true {
        print(prompt, terminator: "")
        if let input = readLine(), !input.trimmingCharacters(in: .whitespaces).isEmpty {
            return input
        } else {
            print("Correction required, please try again. Input cannot be empty.")
        }
    }
}

func readInt(prompt: String) -> Int {
    while true {
        print(prompt, terminator: "")
        if let input = readLine(), let number = Int(input) {
            return number
        } else {
            print("Correction required, please try again. Please enter a valid whole number.")
        }
    }
}

func readDouble(prompt: String) -> Double {
    while true {
        print(prompt, terminator: "")
        if let input = readLine(), let number = Double(input) {
            return number
        } else {
            print("Correction required, please try again. Please enter a valid number.")
        }
    }
}


func main() {
    let manager = EmpManager()

    // Main application loop
    while true {
        print("\n===== Employee Management System =====")
        print("1. Add full-time employee")
        print("2. Add part-time employee")
        print("3. Display all employees")
        print("4. Remove employee by ID")
        print("5. Search for employee by ID")
        print("6. Exit")
        print("====================================")

        let choice = readInt(prompt: "Enter your choice: ")

        switch choice {
        case 1:
            // Add Full-Time Employee
            print("\n-- Adding Full-Time Employee --")
            let name = readString(prompt: "Enter name: ")
            let id = readInt(prompt: "Enter ID: ")
            let salary = readDouble(prompt: "Enter monthly salary: ")
            
            let employee = FullTimeEmployee(name: name, id: id, monthlySalary: salary)
            if manager.addEmployee(employee) {
                print("Full-time employee added successfully.")
            } else {
                print("Error: An employee with ID \(id) already exists. Employee not added.")
            }

        case 2:
            // Add Part-Time Employee
            print("\n-- Adding Part-Time Employee --")
            let name = readString(prompt: "Enter name: ")
            let id = readInt(prompt: "Enter ID: ")
            let rate = readDouble(prompt: "Enter hourly rate: ")
            let hours = readInt(prompt: "Enter hours worked: ")
            
            let employee = PartTimeEmployee(name: name, id: id, hourlyRate: rate, hoursWorked: hours)
            if manager.addEmployee(employee) {
                print("Part-time employee added successfully.")
            } else {
                print("Error: An employee with ID \(id) already exists. Employee not added.")
            }

        case 3:
            // Display All Employees
            manager.displayAllEmployees()
            
        case 4:
            // Remove Employee
            print("\n-- Remove Employee --")
            let id = readInt(prompt: "Enter ID to remove: ")
            if manager.searchEmployee(by: id) != nil {
                manager.removeEmployee(by: id)
                print("Employee with ID \(id) has been removed.")
            } else {
                 print("Employee with ID \(id) not found.")
            }


        case 5:
            // Search for Employee
            print("\n-- Search for Employee --")
            let id = readInt(prompt: "Enter ID to search: ")
            if let employee = manager.searchEmployee(by: id) {
                print("Employee found:")
                employee.displayDetails()
            } else {
                print("Employee with ID \(id) not found.")
            }

        case 6:
            // Exit
            print("Exiting application. Goodbye!")
            return // Exit the main function, which terminates the program.

        default:
            // Handle invalid menu choices
            print("Invalid choice. Please select an option from 1 to 6.")
        }
    }
}

// Start the application by calling the main function.
main()
