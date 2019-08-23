//
//  Storage.swift
//  BMI
//
//  Created by Dmitry Kuzin on 23/08/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import Foundation

class Storage {
    
    static let `default` = Storage()
    let defaults: UserDefaults = UserDefaults.standard
    
    var isOnboardingPresented: Bool {
        get {
            return defaults.bool(forKey: "isOnboardingPresented")
        }
        set {
            defaults.set(newValue, forKey: "isOnboardingPresented")
        }
    }
}
