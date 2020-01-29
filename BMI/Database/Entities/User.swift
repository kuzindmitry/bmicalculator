//
//  User.swift
//  BMI
//
//  Created by Dmitry Kuzin on 23/08/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import CoreData

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
class User: DataEntity {
    typealias Object = UserEntity
    
    //MARK: - Variables
    
    internal var id: String = "1"
    var age: Int = 0
    var height: Double = 0
    var weight: Double = 0
    var weightGoal: Double = 0
    var gender: GenderType = .male
    var weightMetrics: WeightMetricsType = .kg
    var heightMetrics: HeightMetricsType = .cm
    var entity: UserEntity?
    
    /// Current saved user
    static var current: User? {
        let uuid = "1"
        return Database.current.get(at: uuid)
    }
    
    
    // MARK: - Initialization
    
    required init(with entity: UserEntity) {
        
        self.entity = entity
        id = entity.id ?? ""
        age = Int(entity.age)
        height = entity.height
        gender = entity.isMale ? .male : .female
        weight = entity.weight
        weightGoal = entity.weightGoal
        heightMetrics = HeightMetricsType(rawValue: entity.heightMetrics ?? "") ?? .cm
        weightMetrics = WeightMetricsType(rawValue: entity.weightMetrics ?? "") ?? .kg
    }
    
    init() {}
    
    
    // MARK: - Update entity
    
    func update(_ entity: UserEntity) {
        entity.id = id
        entity.age = Int16(age)
        entity.height = height
        entity.isMale = gender == .male
        entity.weight = weight
        entity.weightGoal = weightGoal
        entity.weightMetrics = weightMetrics.rawValue
        entity.heightMetrics = heightMetrics.rawValue
    }
    
}
