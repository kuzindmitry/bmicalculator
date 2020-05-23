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
    let slowTimeInterval: Double = 0.4
    let fastTimeInterval: Double = 0.1
    let delayBeforeFastTimer: Int = 2
    let defaultWeight: String = "50.0"
    
}

//MARK: - Actions
extension WeightField {
    
    @IBAction func weightTextFieldDidBegin(_ sender: UITextField) {

        weightTextField.text = defaultWeight
    }
    
    
    fileprivate func fastTimerDelay(_ delay: Int, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
    
    
    @IBAction func weightMinusButtonTouchedDown(_ sender: UIButton) {
        
        weightMinusButton.backgroundColor = UIColor.white
        weightMinusButton.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
        
        if weightTextField.text?.isEmpty == true {
            weightTextField.text = defaultWeight
        }
        let defaultWeightNumber: Double = Double(weightTextField.text!) ?? 0
        let decreaseWeight: Double = -0.1
        let decreasedWeightResult = defaultWeightNumber + decreaseWeight
        weightTextField.text = String(format: "%.1f", decreasedWeightResult)
        
        slowTimer = Timer.scheduledTimer(timeInterval: slowTimeInterval, target: self, selector: #selector(timerDecreaseAction), userInfo: nil, repeats: true)
        
//        let fastTimerWorkItem = DispatchWorkItem {
//            self.fastTimer = Timer.scheduledTimer(timeInterval: self.fastTimeInterval, target: self, selector: #selector(self.timerDecreaseAction), userInfo: nil, repeats: true)
//        }
//
//        let queue = DispatchQueue(label: "Fast Timer", attributes: .concurrent)
//
//        queue.asyncAfter(deadline: .now() + .seconds(delayBeforeFastTimer), execute: fastTimerWorkItem)
//

        fastTimerDelay(delayBeforeFastTimer) {

            self.slowTimer.invalidate()
            self.fastTimer = Timer.scheduledTimer(timeInterval: self.fastTimeInterval, target: self, selector: #selector(self.timerDecreaseAction), userInfo: nil, repeats: true)
            if self.weightMinusButton.isHighlighted == false {
                self.fastTimer.invalidate()
            }
        }
    }
            
    @IBAction func weightMinusButtonTouchedUpInside(_ sender: UIButton) {
        
        weightMinusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 75.0/255.0, alpha: 1.0)
        fastTimer.invalidate()
        slowTimer.invalidate()
    
    }

    @IBAction func weightPlusButtonTouchedDown(_ sender: UIButton) {
        
        weightPlusButton.backgroundColor = UIColor.white
        weightPlusButton.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
        
        
        if weightTextField.text?.isEmpty == true {
            weightTextField.text = defaultWeight
        }
        let defaultWeightNumber: Double = Double(weightTextField.text!) ?? 0
        
        let increaseWeight: Double = 0.1
        let increasedWeightResult = defaultWeightNumber + increaseWeight
        weightTextField.text = String(format: "%.1f", increasedWeightResult)
        
        slowTimer = Timer.scheduledTimer(timeInterval: slowTimeInterval, target: self, selector: #selector(timerIncreaseAction), userInfo: nil, repeats: true)
        
        fastTimerDelay(delayBeforeFastTimer) {

            self.slowTimer.invalidate()
            self.fastTimer = Timer.scheduledTimer(timeInterval: self.fastTimeInterval, target: self, selector: #selector(self.timerIncreaseAction), userInfo: nil, repeats: true)
            if self.weightPlusButton.isHighlighted == false {
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
        if weightMinusButton.isHighlighted == true {
            weightTextField.text = String(format: "%.1f", decreasedWeightResult)
        }
    }
    
    @objc func timerIncreaseAction() {
        

        let defaultWeightNumber: Double = Double(weightTextField.text!) ?? 0
        let increaseWeight: Double = 0.1
        let increasedWeightResult = defaultWeightNumber + increaseWeight
        if weightPlusButton.isHighlighted == true {
            weightTextField.text = String(format: "%.1f", increasedWeightResult)
        }
    }
}
