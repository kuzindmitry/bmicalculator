//
//  Entity.swift
//  BMI
//
//  Created by Dmitry Kuzin on 23/08/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import CoreData

/// Protocol for database Entities
/// - Author: Dmitry Kuzin
protocol DataEntity {
    associatedtype Object: NSManagedObject
    
    /// Database entity
    var entity: Object? { get set }
    
    /// Unique identifier
    var id: String { get set }
    
    /// Initializer with
    ///
    /// - Parameter entity: Entity object from database
    init(with entity: Object)
    
    /// Update entity values from abstract model
    ///
    /// - Parameter entity: Entity object from database
    func update(_ entity: Object)
}
