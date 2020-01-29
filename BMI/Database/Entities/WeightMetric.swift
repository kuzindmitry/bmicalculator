//
//  WeightMetric.swift
//  BMI
//
//  Created by Dmitry Kuzin on 23/08/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import RealmSwift

/// Weight metric entity
/// - Author: Dmitry Kuzin
class WeightMetric: Entity {
    
    //MARK: - Variables
    
    @objc dynamic var created: Date = Date()
    @objc dynamic var value: Double = 0
    @objc dynamic var change: Double = 0
    
}
