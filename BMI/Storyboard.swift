//
//  Storyboard.swift
//  BMI
//
//  Created by Dmitry Kuzin on 23/08/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import UIKit

struct Storyboard {
    
    struct Onboarding {
        static let name: String = "Onboarding"
        static let storyboard: UIStoryboard = UIStoryboard(name: name, bundle: nil)
        static var initialViewController: UIViewController {
            return storyboard.instantiateInitialViewController()!
        }
        static var onboardingContentViewController: OnboardingContentViewController {
            return storyboard.instantiateViewController(withIdentifier: "OnboardingContentViewController") as! OnboardingContentViewController
        }
    }

    
}
