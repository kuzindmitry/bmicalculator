//
//  WeightField.swift
//  BMI
//
//  Created by Alexey Mefodyev on 02/09/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import UIKit


  
class WeightField: UIView {
    
    //MARK: Outlets

    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var weightMinusButton: UIButton!
    @IBOutlet weak var weightPlusButton: UIButton!

    //MARK: Variables and Constants
    
    var slowTimer = Timer()
    var fastTimer = Timer()
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
        
        
        let defaultWeightNumber: Double = Double(weightTextField.text!) ?? 0
        let decreaseWeight: Double = -0.1
        let decreasedWeightResult = defaultWeightNumber + decreaseWeight
        weightTextField.text = String(format: "%.1f", decreasedWeightResult)
        
        let slowTimeInterval: Double = 0.4
        let fastTimeInterval: Double = 0.05
        slowTimer = Timer.scheduledTimer(timeInterval: slowTimeInterval, target: self, selector: #selector(timerDecreaseAction), userInfo: nil, repeats: true)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.slowTimer.invalidate()
            
            if self.weightMinusButton.isTouchInside == true && self.weightMinusButton.isHighlighted == true {
                self.fastTimer = Timer.scheduledTimer(timeInterval: fastTimeInterval, target: self, selector: #selector(self.timerDecreaseAction), userInfo: nil, repeats: true)
                RunLoop.current.add(self.fastTimer, forMode: .common)
                self.fastTimer.tolerance = 1.5
            } else {
                self.fastTimer.invalidate()
            }
        }
        
    }

    @IBAction func weightMinusButtonTouchedUpInside(_ sender: UIButton) {
        
        weightMinusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 75.0/255.0, alpha: 1.0)
        
        slowTimer.invalidate()
        fastTimer.invalidate()
        
    }
    

    
    
    @IBAction func weightPlusButtonTouchedDown(_ sender: UIButton) {
        
        weightPlusButton.backgroundColor = UIColor.white
        weightPlusButton.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
        
        let defaultWeightNumber: Double = Double(weightTextField.text!) ?? 0
        let increaseWeight: Double = 0.1
        let increasedWeightResult = defaultWeightNumber + increaseWeight
        weightTextField.text = String(format: "%.1f", increasedWeightResult)
        
        let slowTimeInterval: Double = 0.4
        let fastTimeInterval: Double = 0.05
        slowTimer = Timer.scheduledTimer(timeInterval: slowTimeInterval, target: self, selector: #selector(timerIncreaseAction), userInfo: nil, repeats: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.slowTimer.invalidate()
            if self.weightPlusButton.isHighlighted == true && self.weightPlusButton.isTouchInside == true {
                self.fastTimer = Timer.scheduledTimer(timeInterval: fastTimeInterval, target: self, selector: #selector(self.timerIncreaseAction), userInfo: nil, repeats: true)
                
            } else {
                self.fastTimer.invalidate()
            }
        }
        
    }
    
    @IBAction func weightPlusButtonTouchedUpInside(_ sender: UIButton) {
        
        weightPlusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 75.0/255.0, alpha: 1.0)
        
        slowTimer.invalidate()
        fastTimer.invalidate()
        
    }
    
    
    @IBAction func weightMinusButtonOutOfArea(_ sender: UIButton) {
        
        slowTimer.invalidate()
        fastTimer.invalidate()
        weightMinusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 79.0/255.0, alpha: 1.0)
    }
    
    @IBAction func weightPlusButtonOutOfArea(_ sender: UIButton) {
        
      
        slowTimer.invalidate()
        fastTimer.invalidate()
        
        weightPlusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 79.0/255.0, alpha: 1.0)
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
