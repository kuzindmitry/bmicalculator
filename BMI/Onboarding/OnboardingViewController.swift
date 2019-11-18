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
    let image: UIImage
}

/// Onboading page controller
class OnboardingViewController: UIPageViewController {
    
    /// Content for pages
    var items: [OnboardingItem] = [
        OnboardingItem(index: 0, text: "Have you ever thought about your Body Mass Index?", image: #imageLiteral(resourceName: "onboarding_0")),
        OnboardingItem(index: 1, text: "Fill in your physical details and set personal goals on losing weight", image: #imageLiteral(resourceName: "onboarding_1")),
        OnboardingItem(index: 2, text: "See your timeline results in graphics", image: #imageLiteral(resourceName: "onboarding_2"))
    ]
    var pendingIndex = 0
    
    let pageControl = UIPageControl()
    let skipButton = UIButton()
    let backgroundImageView = UIImageView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        delegate = self
        dataSource = self
        let firstController = controller(at: 0)!
        setViewControllers([firstController], direction: .forward, animated: false, completion: nil)
    }
    
    /// Get content controller at index
    ///
    /// - Parameter index: Index of controller
    /// - Returns: OnboardingContentViewController controller
    func controller(at index: Int) -> OnboardingContentViewController? {
        guard index < items.count && index >= 0 else { return nil }
        let item = items[index]
        let contentViewController = Storyboard(.onboarding).controller(OnboardingContentViewController.self)
        contentViewController.item = item
        return contentViewController
    }
}

// MARK: - UI
extension OnboardingViewController {
    
    func prepareUI() {
        createBackground()
        createPageControl()
        createSkipButton()
   

     
    }
    
    func createBackground() {
        let backgroundGradientImageView = UIImageView(frame: view.bounds)
        backgroundGradientImageView.image = #imageLiteral(resourceName: "bg")
        backgroundGradientImageView.contentMode = .scaleAspectFill
        
        backgroundImageView.frame = view.bounds
        backgroundImageView.image = items.first?.image
        backgroundImageView.contentMode = .scaleAspectFill
        
        let topGradientImageView = UIImageView(frame: view.bounds)
        topGradientImageView.image = #imageLiteral(resourceName: "onboarding_gradient")
        topGradientImageView.contentMode = .scaleAspectFill
        
        view.insertSubview(topGradientImageView, at: 0)
        view.insertSubview(backgroundImageView, at: 0)
        view.insertSubview(backgroundGradientImageView, at: 0)
    }
    
    func createPageControl() {
        let isX = UIApplication.shared.statusBarFrame.height > 20
        pageControl.frame = CGRect(x: 40, y: UIScreen.main.bounds.height - 50 - (isX ? 34 : 0), width: 30, height: 8)
        pageControl.currentPage = 0
        pageControl.numberOfPages = items.count
        view.addSubview(pageControl)
    }
    
    func createSkipButton() {
        let isX = UIApplication.shared.statusBarFrame.height > 20
        skipButton.frame = CGRect(x: UIScreen.main.bounds.width - 100, y: UIScreen.main.bounds.height - 66 - (isX ? 34 : 0), width: 100, height: 40)
        skipButton.setTitle("Skip", for: .normal)
        skipButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        skipButton.setTitleColor(.white, for: .normal)
        skipButton.addTarget(self, action: #selector(skipButtonDidTapped), for: .touchUpInside)
        
        view.addSubview(skipButton)
        
    }
    
    func updateSkipButtonState() {
        
        let title = pendingIndex == (items.count - 1) ? "Done" : "Skip"
        skipButton.setTitle(title, for: .normal)
        
//        if skipButton.title(for: UIControl.State.highlighted) == "Done" {
//
//        }
    }

    
    
    func updateCurrentImage() {
        if items.count > pendingIndex {
            let item = items[pendingIndex]
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.05, animations: {
                    self.backgroundImageView.alpha = 0
                }) { _ in
                    self.backgroundImageView.image = item.image
                    UIView.animate(withDuration: 0.05, animations: {
                        self.backgroundImageView.alpha = 1
                    })
                }
            }
        }
    }
}



// MARK: - Actions
extension OnboardingViewController {
    
    @objc func skipButtonDidTapped() {
        guard pendingIndex < (items.count - 1) else {
            doneAction()
            return
        }
        pendingIndex += 1
        guard let controller = self.controller(at: pendingIndex) else { return }
        setViewControllers([controller], direction: .forward, animated: true, completion: nil)
        pageControl.currentPage = pendingIndex
        updateSkipButtonState()
        updateCurrentImage()
    }

    func doneAction() {
        performSegue(withIdentifier: "toCalculator", sender: nil)
    }
    
}

// MARK: - UIPageViewControllerDelegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            pageControl.currentPage = pendingIndex
            updateSkipButtonState()
            updateCurrentImage()
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        guard let item = (pendingViewControllers.first as? OnboardingContentViewController)?.item else { return }
        pendingIndex = item.index
    }
    
}

// MARK: - UIPageViewControllerDataSource
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
