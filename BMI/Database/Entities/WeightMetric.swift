//
//  WeightMetric.swift
//  BMI
//
//  Created by Dmitry Kuzin on 23/08/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import Foundation

/// Weight metric entity
/// - Author: Dmitry Kuzin
class WeightMetric: DataEntity {
    typealias Object = WeightMetricEntity
    
    //MARK: - Variables
    
    internal var id: String = UUID().uuidString
    
    var created: Int64 = 0
    var value: Double = 0
    var change: Double = 0
    var entity: WeightMetricEntity?
    
    
    // MARK: - Initialization
    
    required init(with entity: WeightMetricEntity) {
        id = entity.id ?? ""
        created = entity.created
        value = entity.value
        change = entity.change
    }
    
    init() {}
    
    
    // MARK: - Update entity
    
    func update(_ entity: WeightMetricEntity) {
        entity.id = id
        entity.created = created
        entity.value = value
        entity.change = change
    }
    
}
