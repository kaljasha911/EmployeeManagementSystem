//
//  Employee.swift
//  EmpSysJashan
//
//  Created by Jashan Kalsi on 2025-06-12.
//

import Foundation

class Employee {
    var name: String
    var id: Int
    var salary: Double {
        return 0.0
    }

    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }

    func displayDetails() {
        print("Name: \(name), ID: \(id), Salary: \(String(format: "%.2f", salary))")
    }
}

// FullTimeEmployee subclass
class FullTimeEmployee: Employee {
    var monthlySalary: Double
    override var salary: Double {
        return monthlySalary
    }

    init(name: String, id: Int, monthlySalary: Double) {
        self.monthlySalary = monthlySalary
        super.init(name: name, id: id)
    }

    override func displayDetails() {
        print("Name: \(name), ID: \(id), Monthly Salary: \(String(format: "%.2f", salary)), Tax: \(String(format: "%.2f", calculateTax()))")
    }
}

// PartTimeEmployee subclass
class PartTimeEmployee: Employee {
    var hourlyRate: Double
    var hoursWorked: Int

    override var salary: Double {
        return hourlyRate * Double(hoursWorked)
    }

    init(name: String, id: Int, hourlyRate: Double, hoursWorked: Int) {
        self.hourlyRate = hourlyRate
        self.hoursWorked = hoursWorked
        super.init(name: name, id: id)
    }

    override func displayDetails() {
        print("Name: \(name), ID: \(id), Salary: \(String(format: "%.2f", salary)), Tax: \(String(format: "%.2f", calculateTax()))")
    }
}
