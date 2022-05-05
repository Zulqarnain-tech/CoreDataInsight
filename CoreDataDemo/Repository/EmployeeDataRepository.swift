//
//  EmployeeDataRepository.swift
//  CoreDataDemo
//
//  Created by Zulqarnain on 01/03/2022.
//

import Foundation

import CoreData

struct EmployeeDataRepository : BaseRepository
{
    func create(record: Employee) {
        let cdEmployee = CDEmployee(context: PersistanceStorage.shared.context)
        cdEmployee.id = record.id
        cdEmployee.name = record.name
        cdEmployee.email = record.email
        cdEmployee.profilePic = cdEmployee.profilePic
        if(record.account != nil)
                {
                    let cdPassport = CDAccount(context: PersistanceStorage.shared.context)
                    cdPassport.id = record.account?.id
            cdPassport.salary = record.account!.salary

            cdEmployee.toAccount = cdPassport
                }
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
    
    func update(record: Employee)->Bool {
        let result = getCDEmployee(byIdentifier: record.id)
        guard result != nil else {
            return false
        }
        result?.email = record.email
        result?.name = record.name
        result?.profilePic = record.profilePic
        PersistanceStorage.shared.saveContext()
        return true
    }
    
    func delete(byIdentifier: UUID)->Bool {
        let result = getCDEmployee(byIdentifier: byIdentifier)
        guard result != nil else {
            return false
        }
        if let cdEmployee = result{
            PersistanceStorage.shared.context.delete(cdEmployee)
            PersistanceStorage.shared.saveContext()
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
