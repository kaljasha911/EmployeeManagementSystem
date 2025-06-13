//  Author: Jashan Kalsi - 991494313
//  Course: INFO10229 Mobile Computing
//  Date: 2025-06-11
//  File: main.swift
//
//  Assignment: Employee Management System - Assignment 02

import Foundation

// Function to read a valid string (name) input from the user
func readString(prompt: String) -> String {
    while true {
        print(prompt, terminator: "")
        if let input = readLine(), !input.trimmingCharacters(in: .whitespaces).isEmpty {
            // Regular expression to allow only letters, spaces, hyphens, and apostrophes
            let validNamePattern = "^[A-Za-z\\s-']+$"
            let predicate = NSPredicate(format: "SELF MATCHES %@", validNamePattern)
            if predicate.evaluate(with: input) {
                // Return cleaned and capitalized name if valid
                return input.trimmingCharacters(in: .whitespaces).capitalized
            } else {
                print("Correction required, please try again. Name can only contain letters, spaces, or hyphens.")
            }
        } else {
            print("Correction required, please try again. Input cannot be empty.")
        }
    }
}

// Function to read a valid non-negative integer from the user
func readInt(prompt: String) -> Int {
    while true {
        print(prompt, terminator: "")
        if let input = readLine(), let number = Int(input), number >= 0 {
            return number
        } else {
            print("Correction required, please try again. Please enter a valid whole number.")
        }
    }
}

// Function to read a valid non-negative double (decimal number) from the user
func readDouble(prompt: String) -> Double {
    while true {
        print(prompt, terminator: "")
        if let input = readLine(), let number = Double(input), number >= 0 {
            return number
        } else {
            print("Correction required, please try again. Please enter a valid number.")
        }
    }
}

// Main function that drives the Employee Management System
func main() {
    let manager = EmpManager() // Create an instance of the employee manager

    // Infinite loop for the menu system
    while true {
        // Display the main menu
        print("\n===== Employee Management System =====")
        print("1. Add full-time employee")
        print("2. Add part-time employee")
        print("3. Display all employees")
        print("4. Remove employee by ID")
        print("5. Search for employee by ID")
        print("6. Exit")
        print("====================================")

        let choice = readInt(prompt: "Enter your choice: ") // Get user's menu selection

        switch choice {
        case 1:
            // Case 1: Add a full-time employee
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
            // Case 2: Add a part-time employee
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
            // Case 3: Display all employees
            manager.displayAllEmployees()

        case 4:
            // Case 4: Remove an employee by ID
            print("\n-- Remove Employee --")
            let id = readInt(prompt: "Enter ID to remove: ")
            if manager.searchEmployee(by: id) != nil {
                manager.removeEmployee(by: id)
                print("Employee with ID \(id) has been removed.")
            } else {
                print("Employee with ID \(id) not found.")
            }

        case 5:
            // Case 5: Search for an employee by ID
            print("\n-- Search for Employee --")
            let id = readInt(prompt: "Enter ID to search: ")
            if let employee = manager.searchEmployee(by: id) {
                print("Employee found:")
                employee.displayDetails()
            } else {
                print("Employee with ID \(id) not found.")
            }

        case 6:
            // Case 6: Exit the application
            let confirm = readString(prompt: "Are you sure you want to exit? (y/n): ")
            if confirm.lowercased() == "y" {
                print("Exiting application. Goodbye!")
                return // Exit the main loop and end the program
            }

        default:
            // Handle invalid menu input
            print("Invalid choice. Please select an option from 1 to 6.")
        }
    }
}

// Start the application by calling the main function
main()
