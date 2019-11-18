//
//  Storyboard.swift
//  BMI
//
//  Created by Dmitry Kuzin on 23/08/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import UIKit

/// Storyboards in app
enum StoryboardType: String {
    case onboarding = "Onboarding"
    case main = "Main"
}

enum NavigationControllerType: String {
    case createPost = "CreatePostViewControllerNavigation"
    case editAboutMe = "editAboutMeNavigation"
}


/// Class for work with storyboards
class Storyboard {
    
    /// Name of storyboard
    private let name: String
    
    /// UIStoryboard intance
    private lazy var storyboard: UIStoryboard = {
        return UIStoryboard(name: name, bundle: nil)
    }()
    
    init(_ type: StoryboardType) {
        name = type.rawValue
    }
    
    /// Create controller from storyboard
    /// - Parameter controller: Type of controller
    func controller<T: UIViewController>(_ controller: T.Type) -> T {
        return storyboard.instantiateViewController(withIdentifier: String(describing: controller)) as! T
    }
    
    /// Create navigation controller from storyboard with identifier
    /// - Parameter type: Unique controller type
    func navigationController(_ type: NavigationControllerType) -> UINavigationController {
        return storyboard.instantiateViewController(withIdentifier: type.rawValue) as! UINavigationController
    }
    
    /// Initial view controller for storyboard
    var initialController: UIViewController? {
        return storyboard.instantiateInitialViewController()
    }
    
}

//struct Storyboard {
//    
//    struct Onboarding {
//        static let name: String = "Onboarding"
//        static let storyboard: UIStoryboard = UIStoryboard(name: name, bundle: nil)
//        static var initialViewController: UIViewController {
//            return storyboard.instantiateInitialViewController()!
//        }
//        static var onboardingContentViewController: OnboardingContentViewController {
//            return storyboard.instantiateViewController(withIdentifier: "OnboardingContentViewController") as! OnboardingContentViewController
//        }
//    }
//
//    struct Main {
//        static
//    }
//    
//}
