//
//  Entity.swift
//  BMI
//
//  Created by Dmitry Kuzin on 23/08/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import RealmSwift

class Entity: Object {
    
    @objc dynamic var id: String = UUID().uuidString
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        return id == (object as? Entity)?.id
    }
    
    static func != (lhs: Entity, rhs: Entity) -> Bool {
        return lhs.id != rhs.id
    }
    
}
