//
//  CoreData.swift
//  BMI
//
//  Created by Dmitry Kuzin on 23/08/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import CoreData

final class Database {
    
    static let `current`: Database = Database()
    public var container: NSPersistentContainer
    
    
    //MARK: - Initialization
    
    private init() {
        container = NSPersistentContainer(name: "database")
        container.loadPersistentStores { (_, error) in
            guard let error = error else { return }
            fatalError("Unresolved error \(error)")
        }
    }
    
    
    //MARK: - Get from Core Data
    
    /// Get entity with id
    ///
    /// - Author: Dmitry Kuzin
    /// - Parameters:
    ///   - id: unique identifier of Entity
    /// - Returns: Entity
    func get<T>(at id: String) -> T? where T : DataEntity {
        let predicate = NSPredicate(format: "id=%@", id)
        return get(with: predicate).first
    }
    
    
    /// Get entities with predicate
    ///
    /// - Author: Dmitry Kuzin
    /// - Parameters:
    ///   - predicate: Predicate for fetch request
    /// - Returns: entities
    func get<T>(with predicate: NSPredicate? = nil) -> [T] where T : DataEntity {
        let context = container.viewContext
        let fetchRequest = T.Object.fetchRequest()
        fetchRequest.predicate = predicate
        do {
            let results = try context.fetch(fetchRequest)
            var entities: [T] = []
            results.forEach {
                entities.append(T.init(with: $0 as! T.Object))
            }
            return entities
        } catch {
            print(error)
            return []
        }
    }
    
    /// Async get entities with predicate
    ///
    /// - Author: Dmitry Kuzin
    /// - Parameters:
    ///   - id: unique identifier of Entity
    ///   - completion: Completion handler with entity
    func asyncGet<T>(at id: String, _ completion: @escaping (T?) -> Void) where T : DataEntity {
        let predicate = NSPredicate(format: "id=%@", id)
        asyncGet(with: predicate) { (results) in
            completion(results.first)
        }
    }
    
    /// Async get entities with predicate
    ///
    /// - Author: Dmitry Kuzin
    /// - Parameters:
    ///   - predicate: Predicate for fetch request
    ///   - completion: Completion handler with result entities
    func asyncGet<T>(with predicate: NSPredicate? = nil, _ completion: @escaping ([T]) -> Void) where T : DataEntity {
        DispatchQueue.global().async {
            self.container.performBackgroundTask({ (context) in
                let fetchRequest = T.Object.fetchRequest()
                fetchRequest.predicate = predicate
                do {
                    let results = try context.fetch(fetchRequest)
                    var entities: [T] = []
                    results.forEach {
                        entities.append(T.init(with: $0 as! T.Object))
                    }
                    completion(entities)
                } catch {
                    print(error)
                    completion([])
                }
            })
        }
    }
    
    
    //MARK: - Save to Core Data
    
    /// Save entities in Core Data
    ///
    /// - Author: Dmitry Kuzin
    /// - Parameters:
    ///   - entities: DataEntity objects
    ///   - completion: Completion handler when entities saved
    func add<T>(entities: [T], _ completion: (() -> Void)? = nil) where T : DataEntity {
        DispatchQueue.global().async {
            self.container.performBackgroundTask({ (context) in
                for entity in entities {
                    let object = T.Object(context: context)
                    entity.update(object)
                }
                if context.hasChanges {
                    do {
                        try context.save()
                    } catch {
                        print("Error save")
                        print(error)
                    }
                }
                completion?()
            })
        }
    }
    
    /// Save entities in Core Data
    ///
    /// - Author: Dmitry Kuzin
    /// - Parameters:
    ///   - entities: DataEntity objects
    ///   - completion: Completion handler when entities saved
    func add<T>(entity: T, _ completion: (() -> Void)? = nil) where T : DataEntity {
        add(entities: [entity], completion)
    }
    
}
