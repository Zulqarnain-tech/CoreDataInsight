//
//  EmployeeDataRepository.swift
//  CoreDataDemo
//
//  Created by Zulqarnain on 01/03/2022.
//

import Foundation

import CoreData

protocol EmployeeRepository {

    func create(employee: Employee)
    func getAll() -> [Employee]?
    func get(byIdentifier id: UUID) -> Employee?
    func update(employee: Employee)->Bool
    func delete(id: UUID)->Bool
}

struct EmployeeDataRepository : EmployeeRepository
{
    func create(employee: Employee) {
        let cdEmployee = CDEmployee(context: PersistanceStorage.shared.context)
        cdEmployee.id = employee.id
        cdEmployee.name = employee.name
        cdEmployee.email = employee.email
        cdEmployee.profilePic = cdEmployee.profilePic
        PersistanceStorage.shared.saveContext()
    }
    
    func getAll() -> [Employee]? {
        let result = PersistanceStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        var employeeList: [Employee] = []
        result?.forEach({ CDEmployee in
            employeeList.append(CDEmployee.convertToEmployee())
        })
        return employeeList
    }
    
    func get(byIdentifier id: UUID) -> Employee? {
        let result = getCDEmployee(byIdentifier: id)
        guard result != nil else {
            return nil
        }
        return result?.convertToEmployee()
        
    }
    
    func update(employee: Employee)->Bool {
        let result = getCDEmployee(byIdentifier: employee.id)
        guard result != nil else {
            return false
        }
        result?.email = employee.email
        result?.name = employee.name
        result?.profilePic = employee.profilePic
        PersistanceStorage.shared.saveContext()
        return true
    }
    
    func delete(id: UUID)->Bool {
        let result = getCDEmployee(byIdentifier: id)
        guard result != nil else {
            return false
        }
        if let cdEmployee = result{
            PersistanceStorage.shared.context.delete(cdEmployee)
            return true
        }else{
            return false
        }
    }
    
    func getCDEmployee(byIdentifier id: UUID)-> CDEmployee?{
        let fetchRequest = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = predicate
        do {
            let result = try PersistanceStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else {
                return nil
            }
            return result
        } catch let error {
            debugPrint("Error is \(error)")
        }
        return nil
    }
    
}
