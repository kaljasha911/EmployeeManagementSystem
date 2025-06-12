//
//  PartTimeEmployee.swift
//  EmpSysJashan
//
//  Created by Jashan Kalsi on 2025-06-11.
//

import Foundation

class PartTimeEmployee: Employee, Taxable {
    var hourlyRate: Double
    var hoursWorked: Int

    // Override the 'salary' property to calculate based on hours
    override var salary: Double {
        return hourlyRate * Double(hoursWorked)
    }

    init(name: String, id: Int, hourlyRate: Double, hoursWorked: Int) {
        self.hourlyRate = hourlyRate
        self.hoursWorked = hoursWorked
        super.init(name: name, id: id)
    }

    // Implement the required method from the Taxable protocol
    func calculateTax() -> Double {
        return self.salary * 0.10 // Tax is 10% of salary
    }

    // Override the display method to include all details
    override func displayDetails() {
        super.displayDetails()
        print(", Type: Part-Time, Salary: $\(String(format: "%.2f", salary)), Tax: $\(String(format: "%.2f", calculateTax()))")
    }
}
