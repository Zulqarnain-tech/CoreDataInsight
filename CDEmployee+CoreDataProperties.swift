//
//  CDEmployee+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Zulqarnain on 01/03/2022.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var email: String?
    @NSManaged public var profilePic: Data?
    
    func convertToEmployee() -> Employee{
        return Employee(email: self.email, name: self.name, profilePic: self.profilePic, id: self.id!)
    }

}

extension CDEmployee : Identifiable {

}
