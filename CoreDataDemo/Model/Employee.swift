//
//  Employee.swift
//  CoreDataDemo
//
//  Created by Zulqarnain on 01/03/2022.
//

import Foundation

class Employee{
    let email: String?
    let id:UUID
    let name: String?
    let profilePic: Data?
    
    let account: Account?
    
    init(email: String, id: UUID, name: String, profilePic: Data?, account: Account? = nil){
        self.email = email
        self.name = name
        self.profilePic = profilePic
        self.id = id
        self.account = account
    }
}
