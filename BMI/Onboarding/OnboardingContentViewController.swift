//
//  OnboardingContentViewController.swift
//  BMI
//
//  Created by Dmitry Kuzin on 23/08/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import UIKit

class OnboardingContentViewController: UIViewController {
    
    @IBOutlet private weak var textLabel: UILabel!
    
    var item: OnboardingItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = item.text
        view.clipsToBounds = true
    }
    
}
