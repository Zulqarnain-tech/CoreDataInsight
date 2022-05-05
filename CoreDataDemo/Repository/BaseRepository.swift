//
//  BaseRepository.swift
//  CoreDataDemo
//
//  Created by Zulqarnain on 04/04/2022.
//

import Foundation

protocol BaseRepository {

    associatedtype T

    func create(record: T)
    func getAll() -> [T]?
    func get(byIdentifier id: UUID) -> T?
    func update(record: T) -> Bool
    func delete(byIdentifier id: UUID) -> Bool
}
