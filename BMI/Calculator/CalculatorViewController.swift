//
//  CalculatorViewController.swift
//  BMI
//
//  Created by Alexey Mefodyev on 27/08/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import UIKit
import CoreData


class CalculatorViewController: UIViewController {
    
    let segmentedControlsTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(red: 52.0/255.0, green: 68.0/255.0, blue: 79.0/255.0, alpha: 1.0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        heightTextField.delegate = self
        weightTextField.delegate = self
        ageTextField.delegate = self
        goalTextField.delegate = self
        
        heightSegmentedControl.setTitleTextAttributes(segmentedControlsTextAttributes, for: .selected)
        weightSegmentedControl.setTitleTextAttributes(segmentedControlsTextAttributes, for: .selected)
        
        
        // Background image settings (coded in BackgroundImage.swift file)
        self.view.addBackground()
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var maleButton: UIButton!
    
    @IBOutlet weak var femaleButton: UIButton!
    
    @IBOutlet weak var heightTextField: UITextField! {
        
        didSet {
            heightTextField.layer.cornerRadius = heightTextField.frame.size.height / 2
        }
    }
    
    @IBOutlet weak var weightTextField: UITextField! {
      
        didSet {
           weightTextField.layer.cornerRadius = weightTextField.frame.size.height / 2
        }
        
    }
    
    
    @IBOutlet weak var goalTextField: UITextField! {
        didSet {
            goalTextField.layer.cornerRadius = goalTextField.frame.size.height / 2
        }
    }
    
    @IBOutlet weak var ageTextField: UITextField! {
        didSet {
            ageTextField.layer.cornerRadius = ageTextField.frame.size.height / 2
        }
    }
        
    @IBOutlet weak var saveButton: UIButton! {
        didSet {
            saveButton.layer.cornerRadius = saveButton.frame.size.height / 2
        }
    }
    
    @IBOutlet weak var heightSegmentedControl: UISegmentedControl! {
        
        didSet {
            
        heightSegmentedControl.tintColor = UIColor.clear
        let heightSegmentControlFont = UIFont.systemFont(ofSize: 40)
        
        heightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: heightSegmentControlFont], for: UIControl.State.normal)
        heightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
    heightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: UIControl.State.normal)
            
        }
    }
    
    @IBOutlet weak var weightSegmentedControl: UISegmentedControl! {
        
        didSet {

        weightSegmentedControl.tintColor = UIColor.clear
        let weightSegmentControlFont = UIFont.systemFont(ofSize: 40)
            
        weightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: weightSegmentControlFont], for: UIControl.State.normal)
        weightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        weightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: UIControl.State.normal)
            
        }
    }
    
    // MARK: - Actions
    
    @IBAction func maleButtonPressed(_ sender: UIButton) {
    
        maleButton.isSelected = true
        maleButton.backgroundColor = UIColor.init(red: 114.0/255.0, green: 144.0/255.0, blue: 157.0/255.0, alpha: 1.0)
        femaleButton.backgroundColor = UIColor.init(red: 52.0/255.0, green: 68.0/255.0, blue: 79.0/255.0, alpha: 1.0)

    }
    
    
    @IBAction func femaleButtonPressed(_ sender: UIButton) {
        
        femaleButton.isSelected = true
        femaleButton.backgroundColor = UIColor.init(red: 114.0/255.0, green: 144.0/255.0, blue: 157.0/255.0, alpha: 1.0)
        maleButton.backgroundColor = UIColor.init(red: 52.0/255.0, green: 68.0/255.0, blue: 79.0/255.0, alpha: 1.0)
    }

    @IBAction public func saveUserData(_ sender: UIButton) {
        
        let user = User()
            //TODO: ох
            //FIXME: исправитьь это: добавить аутлеты
        
        if maleButton.isSelected {
            user.gender = GenderType.male
        }
        
        if femaleButton.isSelected {
            user.gender = GenderType.female
        }
        
        user.height = Double(heightTextField.text!)!
        user.weight = Double(weightTextField.text!)!
        user.weightGoal = Double(goalTextField.text!)!
        user.age = Int(ageTextField.text!)!
        
        Database.current.add(entity: user) {
            
        }
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

// MARK: - Delegates

extension CalculatorViewController : UITextFieldDelegate {
    // UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = ".0123456789"
        let allowedCharactersSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharactersSet = CharacterSet (charactersIn: string)
        
        if heightTextField.text!.count > 2 {
            heightTextField.text?.removeLast()
        }
        
        if weightTextField.text!.count > 5 {
            weightTextField.text?.removeLast()
        }
        
        if goalTextField.text!.count > 5 {
            goalTextField.text?.removeLast()
        }

        if ageTextField.text!.count > 1 {
            ageTextField.text?.removeLast()
        }
        
        return allowedCharactersSet.isSuperset(of: typedCharactersSet)
    }
}

