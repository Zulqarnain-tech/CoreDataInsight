//
//  PersistanceStorage.swift
//  CoreDataDemo
//
//  Created by Zulqarnain on 01/03/2022.
//

import Foundation
import CoreData

final class PersistanceStorage{
    
    // Mark: - Properties
    
    lazy var context = persistentContainer.viewContext
    static let shared = PersistanceStorage()
    
    init(){}
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchManagedObject<T: NSManagedObject>(managedObject: T.Type)-> [T]?{
        do {
            guard let result = try PersistanceStorage.shared.context.fetch(managedObject.fetchRequest()) as? [T] else { return nil }
            return result
        } catch let error {
            print("error is \(error)")
        }
        return nil
    }
}
