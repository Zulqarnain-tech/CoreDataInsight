//
//  CDAccount+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Zulqarnain on 04/04/2022.
//
//

import Foundation
import CoreData


extension CDAccount {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDAccount> {
        return NSFetchRequest<CDAccount>(entityName: "CDAccount")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var salary: Int16
    @NSManaged public var toEmployee: CDEmployee?

}

extension CDAccount : Identifiable {

}
