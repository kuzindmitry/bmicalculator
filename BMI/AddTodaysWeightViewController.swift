//
//  AddTodaysWeightViewController.swift
//  BMI
//
//  Created by Alexey Mefodyev on 04/10/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import UIKit

class AddTodaysWeightViewController: UIViewController {


        var weightTimer = Timer()
        let defaultWeight: String = "50.0"
    
        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
        

        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */


    
        
            //MARK: Outlets
        
        @IBOutlet weak var todaysWeightTextField: UITextField! {
            didSet {
                todaysWeightTextField.layer.cornerRadius = todaysWeightTextField.frame.size.height / 2
            }
        }
        
        @IBOutlet weak var weightMinusButton: UIButton! {
            didSet {
                weightMinusButton.layer.cornerRadius = weightMinusButton.frame.size.height / 2
            }
        }
        
        @IBOutlet weak var weightPlusButton: UIButton! {
            didSet {
                weightPlusButton.layer.cornerRadius = weightPlusButton.frame.size.height / 2
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
        }
        
        
        @IBAction func weightMinusButtonTouchedDown(_ sender: UIButton) {
            
            weightMinusButton.backgroundColor = UIColor.white
            weightMinusButton.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
            weightTimer = Timer.scheduledTimer(timeInterval: 0.025, target: self, selector: #selector(timerDecreaseAction), userInfo: nil, repeats: true)
        }
        
        
        @IBAction func weightMinusButtonTouchedUpInside(_ sender: UIButton) {
            
             weightMinusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 75.0/255.0, alpha: 1.0)
             weightTimer.invalidate()
        }
        
        @IBAction func weightMinusButtonTouchedDragOuside(_ sender: UIButton) {
            
            weightTimer.invalidate()
             weightMinusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        }
        
        @IBAction func weightPlusButtonTouchedDown(_ sender: UIButton) {
            
            weightPlusButton.backgroundColor = UIColor.white
            weightPlusButton.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
            weightTimer = Timer.scheduledTimer(timeInterval: 0.025, target: self, selector: #selector(timerIncreaseAction), userInfo: nil, repeats: true)
        }
        
        @IBAction func weightPlusButtonTouchedUpInside(_ sender: UIButton) {
            
            weightPlusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 75.0/255.0, alpha: 1.0)
            weightTimer.invalidate()
        }
        
        @IBAction func weightPlusButtonTouchedDragOutside(_ sender: UIButton) {
            weightTimer.invalidate()
            weightPlusButton.backgroundColor = UIColor.init(red: 41.0/255.0, green: 63.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        }
        
        @IBAction func specificDateWeightTextFieldEditingDidBegin(_ sender: UITextField) {
            
            specificDateWeightTextField.text = defaultWeight
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
        
        @IBAction func addSpecificDateWeightTouchedDown(_ sender: UIButton) {
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
