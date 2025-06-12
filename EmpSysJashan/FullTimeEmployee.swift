//
//  FullTimeEmployee.swift
//  EmpSysJashan
//
//  Created by Jashan Kalsi on 2025-06-11.
//

import Foundation

class FullTimeEmployee: Employee, Taxable {
    var monthlySalary: Double

    // Override the 'salary' property from the Employee class
    override var salary: Double {
        return monthlySalary
    }

    init(name: String, id: Int, monthlySalary: Double) {
        self.monthlySalary = monthlySalary
        super.init(name: name, id: id)
    }

    // Implement the required method from the Taxable protocol
    func calculateTax() -> Double {
        return self.salary * 0.20 // Tax is 20% of salary
    }

    // Override the display method to include all details
    override func displayDetails() {
        super.displayDetails()
        print(", Type: Full-Time, Salary: $\(String(format: "%.2f", salary)), Tax: $\(String(format: "%.2f", calculateTax()))")
    }
}
