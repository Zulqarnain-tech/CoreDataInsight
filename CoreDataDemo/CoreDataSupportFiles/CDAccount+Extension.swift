//
//  CDAccount+Extension.swift
//  CoreDataDemo
//
//  Created by Zulqarnain on 03/05/2022.
//

import Foundation
extension CDAccount {
    func convertToAccount() -> Account?{
        return Account(id: self.id!, salary: self.salary)
    }
}

