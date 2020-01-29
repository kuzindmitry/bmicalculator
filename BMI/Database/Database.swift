//
//  CoreData.swift
//  BMI
//
//  Created by Dmitry Kuzin on 23/08/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import RealmSwift

final class Database {
    
    static let `current`: Database = Database()

    typealias Success = (() -> Void)
    typealias Failure = ((_ error: Error?) -> Void)
    
    private let defaultRealm: Realm
    func realmInstance() throws -> Realm {
        return Thread.isMainThread ? defaultRealm : try Realm()
    }
    
    private init() {
        do {
            defaultRealm = try Realm()
        } catch {
            print(error)
            fatalError()
        }
    }
    
    func add(objects: [Object], success: Success? = nil, failure: Failure? = nil) {
        do {
            let realm = try realmInstance()
            try realm.safeWrite {
                realm.add(objects, update: .all)
            }
            success?()
        } catch {
            print(error)
            failure?(error)
        }
    }
    
    func add(_ object: Object, success: Success? = nil, failure: Failure? = nil) {
        add(objects: [object], success: success, failure: failure)
    }
    
    func delete(_ objects: [Object], success: Success? = nil, failure: Failure? = nil) {
        do {
            let realm = try realmInstance()
            try realm.safeWrite {
                realm.delete(objects)
            }
            success?()
        } catch {
            print(error)
            failure?(error)
        }
    }
    
    func delete(_ object: Object, success: Success? = nil, failure: Failure? = nil) {
        delete([object], success: success, failure: failure)
    }
    
    func deleteAll() {
        let realm = try? realmInstance()
        do {
            try realm?.safeWrite {
                realm?.deleteAll()
                print("All deleted")
            }
        } catch {
            print("Error all delete")
            print(error)
        }
    }
    
    func objects<T: Object>(_ type: T.Type, predicate: NSPredicate? = nil, filter: ((T) -> Bool)? = nil) -> [T] {
        if let results = (try? realmInstance())?.objects(type) {
            if let predicate = predicate {
                return Array(results.filter(predicate))
            } else if let filter = filter {
                return Array(results.filter(filter))
            } else {
                return Array(results)
            }
        }
        return []
    }
    
    func object<Element: Object, KeyType>(_ type: Element.Type, id: KeyType) -> Element? {
        return (try? realmInstance())?.object(ofType: type, forPrimaryKey: id)
    }
    
}

extension Realm {
    
    func safeWrite(_ block: () throws -> Void) throws {
        if isInWriteTransaction {
            try block()
        } else {
            try write(block)
        }
    }
    
}
