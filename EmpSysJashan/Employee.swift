//
//  Employee.swift
//  EmpSysJashan
//
//  Created by Jashan Kalsi on 2025-06-11.
//

import Foundation

class Employee {
    var name: String
    var id: Int

    // Computed property for salary, returns 0 for the base class
    var salary: Double {
        return 0
    }

    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }

    // Method to display basic employee details
    func displayDetails() {
        print("ID: \(id), Name: \(name)", terminator: "")
    }
}


