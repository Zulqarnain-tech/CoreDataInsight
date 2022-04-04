//
//  CDExployee+Extension.swift
//  CoreDataDemo
//
//  Created by Zulqarnain on 04/04/2022.
//

import Foundation
extension CDEmployee {
    func convertToEmployee() -> Employee{
        return Employee(email: self.email, name: self.name, profilePic: self.profilePic, id: self.id!)
    }
}

