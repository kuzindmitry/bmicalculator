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

        weightTextField.delegate = self
        heightTextField.delegate = self
        ageTextField.delegate = self
        goalTextField.delegate = self
        
        // Background image settings (coded in BackgroundImage.swift file)
        
        self.view.addBackground()
        
        
        // Height Segmented Control settings
       
        let heightSegmentedControl = UISegmentedControl (items: ["cm", "ft"])
        heightSegmentedControl.frame = CGRect (x: 70, y: 349, width: 100, height: 50)
        heightSegmentedControl.selectedSegmentIndex = 0
        heightSegmentedControl.tintColor = UIColor.clear
        let heightSegmentControlFont = UIFont.systemFont(ofSize: 40)
        heightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: heightSegmentControlFont], for: UIControl.State.normal)
        heightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        heightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: UIControl.State.normal)
        self.view.addSubview(heightSegmentedControl)
        
       
 
        // Weight Segmented Control settings

        let weightSegmentedControl = UISegmentedControl (items: ["kg", "lb"])
        weightSegmentedControl.frame = CGRect (x: 70, y: 442, width: 100, height: 50)
        weightSegmentedControl.selectedSegmentIndex = 0
        weightSegmentedControl.tintColor = UIColor.clear
        let weightSegmentControlFont = UIFont.systemFont(ofSize: 40)
        weightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: weightSegmentControlFont], for: UIControl.State.normal)
        weightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        weightSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: UIControl.State.normal)
        self.view.addSubview(weightSegmentedControl)
        
    }
    
    
    
    @IBOutlet weak var maleButton: UIButton!
    
    @IBOutlet weak var femaleButton: UIButton!
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var weightMinusButton: UIButton!
    
    
    @IBOutlet weak var weightPlusButton: UIButton!
    
    @IBOutlet weak var goalTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
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
    
    @IBAction func weightTextFieldChanged(_ sender: Any) {
        
    }
    
    @IBAction func weightMinusButtonRepeatingTouch(_ sender: UIButton) {
        //weightMinusButton.backgroundColor. = UIColor.white
    }
    @IBAction func weightMinusButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func weightPlusButtonPressed(_ sender: UIButton) {
        //weightPlusButton.isSelected = true
    }
    

 
    
}

let maxLength = 3

extension CalculatorViewController : UITextFieldDelegate {
    // UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = "0123456789"
        let allowedCharactersSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharactersSet = CharacterSet (charactersIn: string)
        
        if range.location > maxLength - 1 {
            textField.text?.removeLast()
        }
        
        return allowedCharactersSet.isSuperset(of: typedCharactersSet)
    }
}
