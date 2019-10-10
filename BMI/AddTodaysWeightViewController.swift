//
//  AddTodaysWeightViewController.swift
//  BMI
//
//  Created by Alexey Mefodyev on 04/10/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import UIKit

class AddTodaysWeightViewController : UIViewController {


        var weightTimer = Timer()
        let defaultWeight: String = "50.0"
    
        
//MARK: Outlets
        
        @IBOutlet weak var todaysWeightTextField: UITextField! {
            didSet {
                todaysWeightTextField.layer.cornerRadius = todaysWeightTextField.frame.size.height / 2
            }
        }
        
        @IBOutlet weak var todaysWeightMinusButton: UIButton! {
            didSet {
                todaysWeightMinusButton.layer.cornerRadius = todaysWeightMinusButton.frame.size.height / 2
            }
        }
        
        @IBOutlet weak var todaysWeightPlusButton: UIButton! {
            didSet {
                todaysWeightPlusButton.layer.cornerRadius = todaysWeightPlusButton.frame.size.height / 2
            }
        }
        
        @IBOutlet weak var addTodaysWeightButton: UIButton! {
            didSet {
                addTodaysWeightButton.layer.cornerRadius = addTodaysWeightButton.frame.size.height / 2
            }
        }
        
        @IBOutlet weak var datePicker: UIDatePicker!
        
        @IBOutlet weak var specificDateWeightTextField: UITextField! {
            didSet {
                specificDateWeightTextField.layer.cornerRadius = specificDateWeightTextField.frame.size.height / 2
            }
        }
        
        @IBOutlet weak var specificWeightMinusButton: UIButton! {
            didSet {
                specificWeightMinusButton.layer.cornerRadius = specificWeightMinusButton.frame.size.height / 2
            }
        }
        
        @IBOutlet weak var specificWeightPlusButton: UIButton! {
             didSet {
                 specificWeightPlusButton.layer.cornerRadius = specificWeightPlusButton.frame.size.height / 2
             }
         }
        
        @IBOutlet weak var addSpecificDateWeightButton: UIButton! {
            didSet {
                addSpecificDateWeightButton.layer.cornerRadius = addSpecificDateWeightButton.frame.size.height / 2
            }
        }
        
//MARK: Actions
        
    @IBAction func addTodaysWeightTextFieldEditingDidBegin(_ sender: UITextField) {
            
        todaysWeightTextField.text = defaultWeight
        todaysWeightTextField.isEnabled = false
        }
        
    @IBAction func todaysWeightMinusButtonIsTouchedDown(_ sender: UIButton) {
        
    
        todaysWeightMinusButton.backgroundColor = UIColor.white
        todaysWeightMinusButton.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
        weightTimer = Timer.scheduledTimer(timeInterval: 0.025, target: self, selector: #selector(timerDecreaseAction), userInfo: nil, repeats: true)

        
    }
        
    @IBAction func todaysWeightMinusButtonIsTouchedUpInside(_ sender: UIButton) {
        
        todaysWeightMinusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 75.0/255.0, alpha: 1.0)
        weightTimer.invalidate()
        
    }
        
    
    @IBAction func todaysWeightMinusButtonIsTouchedDragOutside(_ sender: UIButton) {
        
        weightTimer.invalidate()
        todaysWeightMinusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        
    }
    
    @IBAction func todaysWeightPlusButtonIsTouchedDown(_ sender: UIButton) {
        
        todaysWeightPlusButton.backgroundColor = UIColor.white
        todaysWeightPlusButton.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
        weightTimer = Timer.scheduledTimer(timeInterval: 0.025, target: self, selector: #selector(timerIncreaseAction), userInfo: nil, repeats: true)
    }
    
        
    @IBAction func todaysWeightPlusButtonIsTouchedUpInside(_ sender: UIButton) {
        
        todaysWeightPlusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 75.0/255.0, alpha: 1.0)
        weightTimer.invalidate()
        
    }
    
        
    @IBAction func todaysWeightPlusButtonIsTouchedDragOutside(_ sender: UIButton) {
        
        weightTimer.invalidate()
        todaysWeightPlusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 79.0/255.0, alpha: 1.0)
    }
    

    //FIXME: Today's Weight adding function
    
    @IBAction func addTodaysWeightButtonIsTouchedDown(_ sender: UIButton) {
        
        let user = User()
        
        Database.current.add(entity: user) {
            user.weight = Double(self.todaysWeightTextField.text!)!
        }
        
        func addTodaysWeight() -> [PointEntry] {
            var result: [PointEntry] = []
            
            
                let value = User.current!.weight
            
                let formatter = DateFormatter()
                formatter.dateFormat = "d MMM"
                let today = Date()
                    
                result.append(PointEntry(value: Int(value), label: formatter.string(from: today)))
            
        
            return result
        }
    }
    
        
        @IBAction func specificDateWeightTextFieldEditingDidBegin(_ sender: UITextField) {
            
            specificDateWeightTextField.text = defaultWeight
            specificDateWeightTextField.isEnabled = false
        }
        
        @IBAction func specificWeightMinusButtonTouchedDown(_ sender: UIButton) {
            
            specificWeightMinusButton.backgroundColor = UIColor.white
            specificWeightMinusButton.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
            weightTimer = Timer.scheduledTimer(timeInterval: 0.025, target: self, selector: #selector(specificDateTimerDecreaseAction), userInfo: nil, repeats: true)
        }
        
        @IBAction func specificWeightMinusButtonTouchedUpInside(_ sender: UIButton) {
            
            specificWeightMinusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 75.0/255.0, alpha: 1.0)
            weightTimer.invalidate()
        }
        
        @IBAction func specificWeightMinusButtonTouchedDragOutside(_ sender: UIButton) {
            
            weightTimer.invalidate()
            specificWeightMinusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        }
        
        
        @IBAction func specificWeightPlusButtonTouchedDown(_ sender: UIButton) {
            
            specificWeightPlusButton.backgroundColor = UIColor.white
            specificWeightPlusButton.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
            weightTimer = Timer.scheduledTimer(timeInterval: 0.025, target: self, selector: #selector(specificDateTimerIncreaseAction), userInfo: nil, repeats: true)
        }
        
        @IBAction func specificWeightPlusButtonTouchedUpInside(_ sender: UIButton) {
            
            specificWeightPlusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 75.0/255.0, alpha: 1.0)
            weightTimer.invalidate()
        }
        
        @IBAction func specificWeightPlusButtonTouchedDragOutside(_ sender: UIButton) {
            
            weightTimer.invalidate()
            specificWeightPlusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        }
        
    
    //FIXME: Specific Weight adding function
        @IBAction func addSpecificDateWeightTouchedDown(_ sender: UIButton) {
        
            let user = User()
            
            Database.current.add(entity: user) {
                user.weight = Double(self.specificDateWeightTextField.text!)!
            }
            
            func addSpecificWeight() -> [PointEntry] {
                var result: [PointEntry] = []
                
                let value = User.current!.weight
            
                let formatter = DateFormatter()
                formatter.dateFormat = "d MMM"
                let date = datePicker.date
                    
                result.append(PointEntry(value: Int(value), label: formatter.string(from: date)))

                return result
            }
            
        }
        
    }


    


//MARK: Extensions

extension AddTodaysWeightViewController {
    
@objc func timerDecreaseAction() {
        
        let defaultWeightNumber: Double = Double(todaysWeightTextField.text!) ?? 0
        let decreaseWeight: Double = -0.1
        let decreasedWeightResult = defaultWeightNumber + decreaseWeight
        todaysWeightTextField.text = String(format: "%.1f", decreasedWeightResult)
        
    }
    
@objc func timerIncreaseAction() {
        
        let defaultWeightNumber: Double = Double(todaysWeightTextField.text!) ?? 0
        let increaseWeight: Double = 0.1
        let increasedWeightResult = defaultWeightNumber + increaseWeight
        todaysWeightTextField.text = String(format: "%.1f", increasedWeightResult)
        
    }
    
@objc func specificDateTimerDecreaseAction() {
        
        let defaultWeightNumber: Double = Double(specificDateWeightTextField.text!) ?? 0
        let decreaseWeight: Double = -0.1
        let decreasedWeightResult = defaultWeightNumber + decreaseWeight
        specificDateWeightTextField.text = String(format: "%.1f", decreasedWeightResult)
        
    }
    
@objc func specificDateTimerIncreaseAction() {
    
    let defaultWeightNumber: Double = Double(specificDateWeightTextField.text!) ?? 0
    let increaseWeight: Double = 0.1
    let increasedWeightResult = defaultWeightNumber + increaseWeight
    specificDateWeightTextField.text = String(format: "%.1f", increasedWeightResult)
    
   }
    
}
