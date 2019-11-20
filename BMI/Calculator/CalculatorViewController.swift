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
    
    // MARK: - Outlets
    
    @IBOutlet weak var maleButtonContainer: UIView!
    @IBOutlet weak var femaleButtonContainer: UIView!
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var heightSegmentedControl: UISegmentedControl!
    @IBOutlet weak var weightSegmentedControl: UISegmentedControl!
    
    let segmentedControlsTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 52.0/255.0, green: 68.0/255.0, blue: 79.0/255.0, alpha: 1.0)]
    
    var gender: GenderType = .male
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightSegmentedControl.prepare()
        weightSegmentedControl.prepare()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        ageTextField.delegate = self
        goalTextField.delegate = self
        
        heightTextField.setCircleRadius()
        weightTextField.setCircleRadius()
        ageTextField.setCircleRadius()
        goalTextField.setCircleRadius()
        
        saveButton.setCircleRadius()
        
        updateGenderButtons()
        
        heightSegmentedControl.setTitleTextAttributes(segmentedControlsTextAttributes, for: .selected)
        weightSegmentedControl.setTitleTextAttributes(segmentedControlsTextAttributes, for: .selected)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        // Background image settings (coded in BackgroundImage.swift file)
        self.view.addBackground()
        
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    

    
    // MARK: - Actions
    
    @IBAction func genderButtonTouched(_ sender: UIButton) {
        gender = GenderType(rawValue: sender.tag) ?? gender
        updateGenderButtons()
    }
    
    func updateGenderButtons() {
        let selectedColor: UIColor = UIColor(red: 114.0/255.0, green: 144.0/255.0, blue: 157.0/255.0, alpha: 1.0)
        let unselectedColor: UIColor = UIColor(red: 52.0/255.0, green: 68.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        maleButtonContainer.backgroundColor = gender == .male ? selectedColor : unselectedColor
        femaleButtonContainer.backgroundColor = gender == .female ? selectedColor : unselectedColor
    }
    
    @IBAction func saveUserData(_ sender: UIButton) {
        
        let user = User()
        let height = Double(heightTextField.text ?? "") ?? 0
        let weight = Double(weightTextField.text ?? "") ?? 0
        let goal = Double(goalTextField.text ?? "") ?? 0
        let age = Int(ageTextField.text ?? "") ?? 0
        
        let weightIndex = weightSegmentedControl.selectedSegmentIndex
        let weightMetrics: WeightMetricsType = weightIndex == 1 ? .lb : .kg
        let heightIndex = heightSegmentedControl.selectedSegmentIndex
        let heightMetrics: HeightMetricsType = heightIndex == 1 ? .ft : .cm
        
        Database.current.add(entity: user) {
            
            user.gender = self.gender
            user.height = height
            user.weight = weight
            user.weightGoal = goal
            user.age = age
            user.weightMetrics = weightMetrics
            user.heightMetrics = heightMetrics
            
            DispatchQueue.main.async {
                Storage.default.isOnboardingPresented = true
                let controller = Storyboard(.main).initialController!
                self.present(controller, animated: true, completion: nil)
            }
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        self.view.frame.origin.y = 0
    }
    
}

// MARK: - Extensions

extension CalculatorViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = ".0123456789"
        let allowedCharactersSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharactersSet = CharacterSet (charactersIn: string)
        
        if heightTextField.text!.count > 3 {
            heightTextField.text?.removeLast()
        }
        
        if weightTextField.text!.count > 5 {
            weightTextField.text?.removeLast()
        }
        
        if goalTextField.text!.count > 5 {
            goalTextField.text?.removeLast()
        }
        
        if ageTextField.text!.count > 2 {
            ageTextField.text?.removeLast()
        }
        
        return allowedCharactersSet.isSuperset(of: typedCharactersSet)
    }
    
    @objc func keyboardWillChange (notification: Notification) {
        
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        if goalTextField.isEditing == true || ageTextField.isEditing == true {
            if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification { view.frame.origin.y = -keyboardRect.height }
            
        }
    }
}


extension UITextField {
    
    func setCircleRadius() {
        setCornerRadius(frame.size.height/2)
    }
    
    func setCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
}

extension UISegmentedControl {
    
    func prepare() {
        tintColor = UIColor.clear
        let heightSegmentControlFont = UIFont.systemFont(ofSize: 40)
        
        setTitleTextAttributes([NSAttributedString.Key.font: heightSegmentControlFont], for: UIControl.State.normal)
        setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: UIControl.State.normal)
        
    }
}

