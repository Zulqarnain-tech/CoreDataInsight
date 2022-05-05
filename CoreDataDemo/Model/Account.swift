//
//  Account.swift
//  CoreDataDemo
//
//  Created by Zulqarnain on 04/04/2022.
//

import Foundation
import UIKit

class Account{
    let id: UUID
    let salary: Int16
    
    init(id: UUID, salary: Int16){
        self.id = id
        self.salary = salary
    }
}
