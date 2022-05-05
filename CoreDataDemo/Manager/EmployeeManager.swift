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
        _employeeDataRepository.create(record: employee)
    }

    func fetchEmployees() -> [Employee]? {
        // fetch employee code here
        return _employeeDataRepository.getAll()
    }

    func updateEmployee(employee: Employee) -> Bool {
        // update employee code here
        return _employeeDataRepository.update(record: employee)
    }

    func deleteEmployee(id: UUID) -> Bool {
        // delete employee code here
        return _employeeDataRepository.delete(byIdentifier: id)
    }
    func fetchEmployeeById(byIdentifer id: UUID)->Employee?{
        return _employeeDataRepository.get(byIdentifier: id)
    }
    func deleteAll()-> Bool{
        let result = PersistanceStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        guard result != nil else {
            return false
        }

        result?.forEach({ object in
                PersistanceStorage.shared.context.delete(object)
        })
        PersistanceStorage.shared.saveContext()
        return true
    }
    func getAll() -> [Employee]? {

            let result = PersistanceStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        guard result != nil && result?.count != 0 else {return nil}
            var employees : [Employee] = []

            result?.forEach({ (cdEmployee) in
                employees.append(cdEmployee.convertToEmployee())
            })

            return employees
        }
}
