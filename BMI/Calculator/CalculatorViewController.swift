//
//  CalculatorViewController.swift
//  BMI
//
//  Created by Alexey Mefodyev on 27/08/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var maleButtonContainer: UIView!
    @IBOutlet weak var femaleButtonContainer: UIView!
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var weightMinusButton: UIButton!
    @IBOutlet weak var weightPlusButton: UIButton!
    
    
    
    @IBOutlet weak var heightSegmentedControl: UISegmentedControl!
    @IBOutlet weak var weightSegmentedControl: UISegmentedControl!
    
    //Stack Views Outlets for correct layout settings
    @IBOutlet weak var bmiCalculatorLabel: UILabel!
    
    @IBOutlet weak var genderStackView: UIStackView!
    @IBOutlet weak var malePicture: UIImageView!
    @IBOutlet weak var maleLabel: UILabel!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femalePicture: UIImageView!
    @IBOutlet weak var femaleLabel: UILabel!
    @IBOutlet weak var femaleButton: UIButton!
    

    @IBOutlet weak var dataFieldSuperStackView: UIStackView!
    @IBOutlet weak var measuresStackView: UIStackView!
    @IBOutlet weak var textViewsStackView: UIStackView!
    
    
    @IBOutlet weak var saveButton: UIButton!
    

    let segmentedControlsTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 52.0/255.0, green: 68.0/255.0, blue: 79.0/255.0, alpha: 1.0)]
    
    var gender: GenderType = .male
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constraintsSizerDependingOnDevice()
        
        heightSegmentedControl.prepare()
        weightSegmentedControl.prepare()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        ageTextField.delegate = self
        goalTextField.delegate = self
        
        
        heightTextField.setCircleRadius()
        weightTextField.setCircleRadius()
        weightMinusButton.setCircleRadius()
        weightPlusButton.setCircleRadius()
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
    
    ///Gender Buttons functionality settings
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
    
    ///Text Fields Events Setting
    @IBAction func heightTextFieldEditingDidBegin(_ sender: UITextField) {
        
        if heightSegmentedControl.selectedSegmentIndex == 0 {
            heightTextField.text = "160"
        } else {
            heightTextField.text = "5.25"
        }
        ageTextField.clearsOnBeginEditing = false
    }
    
    @IBAction func weightTextFieldEditingDidBegin(_ sender: UITextField) {
        
        if weightSegmentedControl.selectedSegmentIndex == 0 {
            weightTextField.text = "50.0"
        } else {
            weightTextField.text = "125.0"
        }
    }
    
    @IBAction func goalTextFieldEditingDidBegin(_ sender: UITextField) {
        
        if weightSegmentedControl.selectedSegmentIndex == 0 {
            goalTextField.text = "49.0"
        } else {
            goalTextField.text = "108"
        }
    }
    
    @IBAction func ageTextFieldEditingDidBegin(_ sender: UITextField) {
        
        ageTextField.text = "32"
    }
    
    @IBAction func heightTextFieldEditingChanged(_ sender: UITextField) {
        
        if heightSegmentedControl.selectedSegmentIndex == 0 {
            checkMaxLength(textField: heightTextField, maxLength: 3)
        } else {
            checkMaxLength(textField: heightTextField, maxLength: 4)
        }
    }
    
    @IBAction func weightTextFieldEditingChanged(_ sender: UITextField) {
        
        if weightSegmentedControl.selectedSegmentIndex == 0 {
            checkMaxLength(textField: weightTextField, maxLength: 4)
        } else {
            checkMaxLength(textField: weightTextField, maxLength: 5)
        }
    }
    
    @IBAction func goalTextFieldEditingChanged(_ sender: UITextField) {
        
        if weightSegmentedControl.selectedSegmentIndex == 0 {
            checkMaxLength(textField: goalTextField, maxLength: 4)
        } else {
            checkMaxLength(textField: goalTextField, maxLength: 5)
        }
    }
    
    @IBAction func ageTextFieldEditingChanged(_ sender: UITextField) {
        
        checkMaxLength(textField: ageTextField, maxLength: 2)
    }
    
    
    ///User's Data Saving
    @IBAction func saveUserData(_ sender: UIButton) {
        
        let user = User()
        let height = Double(heightTextField.text ?? "") ?? 0
        let weight = Double(weightTextField.text ?? "") ?? 0
        let goal = Double(goalTextField.text ?? "") ?? 0
        let age = Int(ageTextField.text!) ?? 0
        
        let weightIndex = weightSegmentedControl.selectedSegmentIndex
        let weightMetrics: WeightMetricsType = weightIndex == 1 ? .lb : .kg
        let heightIndex = heightSegmentedControl.selectedSegmentIndex
        let heightMetrics: HeightMetricsType = heightIndex == 1 ? .ft : .cm
        
        user.genderValue = gender.rawValue
        user.height = height
        user.weight = weight
        user.weightGoal = goal
        user.age = age
        user.weightMetricTypeValue = weightMetrics.rawValue
        user.heightMetricTypeValue = heightMetrics.rawValue
        user.id = "1"
        
        Database.current.add(user, success: {
            DispatchQueue.main.async {
                Storage.default.isOnboardingPresented = true
                let controller = Storyboard(.main).initialController!
                self.present(controller, animated: true, completion: nil)
            }
            print("User data saved successfully and contains gender: \(user.gender), age: \(user.age), height: \(user.height) \(user.heightMetricType), weight: \(user.weight) \(user.weightMetricType) with goal \(user.weightGoal)")
        }, failure: { error in
            print(error?.localizedDescription ?? "none")
        })
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
        
        return allowedCharactersSet.isSuperset(of: typedCharactersSet)
    }
    
    func checkMaxLength(textField: UITextField!, maxLength: Int) {
        if textField.text!.count > maxLength {
            textField.deleteBackward()
        }
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

extension UIButton {
    
    func setCircleRadius () {
        setCornerRadius(frame.size.height/2)
        masksToBounds()
    }
    
    func setCornerRadius (_ radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    func masksToBounds() {
        layer.masksToBounds = true
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



