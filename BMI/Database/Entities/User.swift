//
//  User.swift
//  BMI
//
//  Created by Dmitry Kuzin on 23/08/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import RealmSwift

enum GenderType: Int {
    case male, female
}

enum WeightMetricsType: String {
    case kg = "kg"
    case lb = "lb"
}

enum HeightMetricsType: String {
    case cm = "cm"
    case ft = "ft"
}

/// User entity
/// - Author: Dmitry Kuzin
class User: Entity {
    
    //MARK: - Variables
    @objc dynamic var age: Int = 0
    @objc dynamic var height: Double = 0
    @objc dynamic var weight: Double = 0
    @objc dynamic var weightGoal: Double = 0
    @objc dynamic var genderValue: Int = 0
    @objc dynamic var weightMetricTypeValue: String = WeightMetricsType.kg.rawValue
    @objc dynamic var heightMetricTypeValue: String = HeightMetricsType.cm.rawValue
    
    let metrics = List<WeightMetric>()
    
    var gender: GenderType {
        return GenderType(rawValue: genderValue) ?? .male
    }
    
    var weightMetricType: WeightMetricsType {
        return WeightMetricsType(rawValue: weightMetricTypeValue) ?? .kg
    }
    
    var heightMetricType: HeightMetricsType {
        return HeightMetricsType(rawValue: heightMetricTypeValue) ?? .cm
    }
    
    /// Current saved user
    static var current: User? {
        let uuid = "1"
        return Database.current.object(User.self, id: uuid)
    }
    
}
