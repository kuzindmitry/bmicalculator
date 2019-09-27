//
//  WeightField.swift
//  BMI
//
//  Created by Alexey Mefodyev on 02/09/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import UIKit

  
class WeightField: UIView {
    
    
    
    // Outlets
    @IBOutlet public weak var weightTextField: UITextField!
        
//        didSet {
//            weightTextField.layer.cornerRadius = weightTextField.frame.size.height / 2
//        }
    
    
    @IBOutlet weak var weightMinusButton: UIButton!

    @IBOutlet weak var weightPlusButton: UIButton!
    

    
    // Variabled
    var weightTimer = Timer()
    let defaultWeight: String = "50.0"
    
}

//MARK: - Actions
extension WeightField {
    
    @IBAction func weightTextFieldDidBegin(_ sender: UITextField) {
        
        weightTextField.text = defaultWeight
    }
    
    @IBAction func weightMinusButtonTouchedDown(_ sender: UIButton) {
        
        weightMinusButton.backgroundColor = UIColor.white
        weightMinusButton.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
        
        weightTimer = Timer.scheduledTimer(timeInterval: 0.03, target: self, selector: #selector(timerDecreaseAction), userInfo: nil, repeats: true)
    
    }
    

    @IBAction func weightMinusButtonTouchedUpInside(_ sender: UIButton) {
        
        weightMinusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 75.0/255.0, alpha: 1.0)
       
        
        weightTimer.invalidate()
        
    }
    
    
    @IBAction func weightPlusButtonTouchedDown(_ sender: UIButton) {
        
        weightPlusButton.backgroundColor = UIColor.white
        weightPlusButton.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
        
        weightTimer = Timer.scheduledTimer(timeInterval: 0.03, target: self, selector: #selector(timerIncreaseAction), userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func weightPlusButtonTouchedUpInside(_ sender: UIButton) {
        
        weightPlusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 75.0/255.0, alpha: 1.0)
        
        weightTimer.invalidate()
        
    }
    
    
}

//MARK: - Subactions
extension WeightField {
    
    @objc func timerDecreaseAction() {
        
        let defaultWeightNumber: Double = Double(weightTextField.text!) ?? 0
        let decreaseWeight: Double = -0.1
        let decreasedWeightResult = defaultWeightNumber + decreaseWeight
        weightTextField.text = String(format: "%.1f", decreasedWeightResult)
        
    }
    
    @objc func timerIncreaseAction() {
        
        let defaultWeightNumber: Double = Double(weightTextField.text!) ?? 0
        let increaseWeight: Double = 0.1
        let increasedWeightResult = defaultWeightNumber + increaseWeight
        weightTextField.text = String(format: "%.1f", increasedWeightResult)
        
    }
    
}
