//
//  OnboardingViewController.swift
//  BMI
//
//  Created by Dmitry Kuzin on 23/08/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import UIKit

struct OnboardingItem {
    let index: Int
    let text: String
}

class OnboardingViewController: UIPageViewController {
    
    var items: [OnboardingItem] = [
        OnboardingItem(index: 0, text: "Have you ever thought about your Body Mass Index?"),
        OnboardingItem(index: 1, text: "Fill in your physical details and set personal goals on losing weight"),
        OnboardingItem(index: 2, text: "See your timeline results in graphics")
    ]
    
    let pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        view.addSubview(pageControl)
        let firstController = controller(at: 0)!
        setViewControllers([firstController], direction: .forward, animated: false, completion: nil)
    }
    
    func controller(at index: Int) -> OnboardingContentViewController? {
        guard index < items.count && index >= 0 else { return nil }
        let item = items[index]
        let contentViewController = Storyboard.Onboarding.onboardingContentViewController
        contentViewController.item = item
        return contentViewController
    }
    
}

extension OnboardingViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
    }
    
}

extension OnboardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let contentViewController = viewController as? OnboardingContentViewController else { return nil }
        let index = contentViewController.item.index - 1
        return controller(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let contentViewController = viewController as? OnboardingContentViewController else { return nil }
        let index = contentViewController.item.index + 1
        return controller(at: index)
    }
    
}
