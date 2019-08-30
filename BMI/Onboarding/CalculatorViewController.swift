//
//  CalculatorViewController.swift
//  BMI
//
//  Created by Alexey Mefodyev on 27/08/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Background image settings (coded in BackgroundImage.swift file)
        
        self.view.addBackground()
        
        
        // Height Segmented Control settings
       
        let heightSegmentedControl = UISegmentedControl (items: ["cm", "ft"])
        heightSegmentedControl.frame = CGRect (x: 70, y: 420, width: 100, height: 50)
        heightSegmentedControl.selectedSegmentIndex = 0
        heightSegmentedControl.tintColor = UIColor.clear
        let heightSegmentControlFont = UIFont.systemFont(ofSize: 35)
        heightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: heightSegmentControlFont], for: UIControl.State.normal)
        heightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        heightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: UIControl.State.normal)
        self.view.addSubview(heightSegmentedControl)
        
       
 
        // Weight Segmented Control settings

        let weightSegmentedControl = UISegmentedControl (items: ["kg", "lb"])
        weightSegmentedControl.frame = CGRect (x: 70, y: 510, width: 100, height: 50)
        weightSegmentedControl.selectedSegmentIndex = 0
        weightSegmentedControl.tintColor = UIColor.clear
        let weightSegmentControlFont = UIFont.systemFont(ofSize: 35)
        weightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: weightSegmentControlFont], for: UIControl.State.normal)
        weightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        weightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: UIControl.State.normal)
        self.view.addSubview(weightSegmentedControl)
        
        
        // Adds Height, Goal and Age TextFields from functions initialized from extension below
        createHeightTextField()
        createGoalTextField()
        createAgeTextField()
        
        
        

    }
    
}

extension CalculatorViewController {
    
    func createHeightTextField() {
        let heightTextField = UITextField(frame: CGRect(x: 210, y: 400, width: 150, height: 80))
        heightTextField.backgroundColor = UIColor.init(red: 47.0/255.0, green: 63.0/255.0, blue: 75.0/255.0, alpha: 1.0)
        heightTextField.font = UIFont.systemFont(ofSize: 40)
        heightTextField.textColor = UIColor.init(red: 114.0/255.0, green: 144.0/255.0, blue: 157.0/255.0, alpha: 1.0)
        heightTextField.textAlignment = NSTextAlignment.center
        heightTextField.borderStyle = UITextField.BorderStyle.none
        heightTextField.layer.cornerRadius = 40
        heightTextField.layer.masksToBounds = true
        self.view.addSubview(heightTextField)
        
    }
    
    func createGoalTextField() {
        
        let goalTextField = UITextField(frame: CGRect(x: 210, y: 600, width: 150, height: 80))
        goalTextField.backgroundColor = UIColor.init(red: 47.0/255.0, green: 63.0/255.0, blue: 75.0/255.0, alpha: 1.0)
        goalTextField.font = UIFont.systemFont(ofSize: 40)
        goalTextField.textColor = UIColor.init(red: 114.0/255.0, green: 144.0/255.0, blue: 157.0/255.0, alpha: 1.0)
        goalTextField.textAlignment = NSTextAlignment.center
        goalTextField.borderStyle = UITextField.BorderStyle.none
        goalTextField.layer.cornerRadius = 40
        goalTextField.layer.masksToBounds = true
        self.view.addSubview(goalTextField)
        
    }
    
    func createAgeTextField() {
        
        let ageTextField = UITextField(frame: CGRect(x: 210, y: 700, width: 150, height: 80))
        ageTextField.backgroundColor = UIColor.init(red: 47.0/255.0, green: 63.0/255.0, blue: 75.0/255.0, alpha: 1.0)
        ageTextField.font = UIFont.systemFont(ofSize: 40)
        ageTextField.textColor = UIColor.init(red: 114.0/255.0, green: 144.0/255.0, blue: 157.0/255.0, alpha: 1.0)
        ageTextField.textAlignment = NSTextAlignment.center
        ageTextField.borderStyle = UITextField.BorderStyle.none
        ageTextField.layer.cornerRadius = 40
        ageTextField.layer.masksToBounds = true
        self.view.addSubview(ageTextField)
        
    }
}

class WeightField : UIView {
    
    let weightTextField = UITextField()
    let weightMinusButton = UIButton()
    let weightPlusButton = UIButton()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createWeightTextField() {
        
        let weightTextField = UITextField(frame: CGRect(x: 210, y: 500, width: 150, height: 80))
        weightTextField.backgroundColor = UIColor.init(red: 47.0/255.0, green: 63.0/255.0, blue: 75.0/255.0, alpha: 1.0)
        weightTextField.font = UIFont.systemFont(ofSize: 40)
        weightTextField.textColor = UIColor.init(red: 114.0/255.0, green: 144.0/255.0, blue: 157.0/255.0, alpha: 1.0)
        weightTextField.textAlignment = NSTextAlignment.center
        weightTextField.borderStyle = UITextField.BorderStyle.none
        weightTextField.layer.cornerRadius = 40
        weightTextField.layer.masksToBounds = true
        self.addSubview(weightTextField)
    }
    
    func createWeightMinusButton() {
        
    }

    func createWeightPlusButton() {
        
    }

    
    
}
