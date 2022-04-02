//
//  EmployeeManager.swift
//  CoreDataDemo
//
//  Created by Zulqarnain on 01/03/2022.
//

import Foundation
import CoreData

struct EmployeeManager
{
    private let _employeeDataRepository = EmployeeDataRepository()
    func createEmployee(employee: Employee) {
        // create employee code here
        _employeeDataRepository.create(employee: employee)
    }

    func fetchEmployees() -> [Employee]? {
        // fetch employee code here
        return _employeeDataRepository.getAll()
    }

    func updateEmployee(employee: Employee) -> Bool {
        // update employee code here
        return _employeeDataRepository.update(employee: employee)
    }

    func deleteEmployee(id: UUID) -> Bool {
        // delete employee code here
        return _employeeDataRepository.delete(id: id)
    }
    func fetchEmployeeById(byIdentifer id: UUID)->Employee?{
        return _employeeDataRepository.get(byIdentifier: id)
    }
}
