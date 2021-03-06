//
//  CDEmployee+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Zulqarnain on 04/04/2022.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var profilePic: Data?
    @NSManaged public var toAccount: CDAccount?

}

extension CDEmployee : Identifiable {

}
