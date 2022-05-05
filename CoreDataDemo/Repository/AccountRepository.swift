//
//  AccountRepository.swift
//  CoreDataDemo
//
//  Created by Zulqarnain on 04/04/2022.
//

import Foundation

class AccountRepository: BaseRepository{
    func create(record: Account) {
        
    }
    
    func getAll() -> [Account]? {
        return nil
    }
    
    func get(byIdentifier id: UUID) -> Account? {
        return nil
    }
    
    func update(record: Account) -> Bool {
        return false
    }
    
    func delete(byIdentifier id: UUID) -> Bool {
        return false
    }
    
    typealias T = Account
}
