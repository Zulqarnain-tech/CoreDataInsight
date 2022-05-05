//
//  CDExployee+Extension.swift
//  CoreDataDemo
//
//  Created by Zulqarnain on 04/04/2022.
//

import Foundation
extension CDEmployee {
    func convertToEmployee() -> Employee{
        return Employee(email: self.email!, id: self.id!, name: self.name!, profilePic: self.profilePic, account: self.toAccount?.convertToAccount())
    }
}


