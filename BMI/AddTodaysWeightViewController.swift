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
    var defaultWeight: String = "50.0"
    
    
    //MARK: Outlets
    
    @IBOutlet weak var todaysWeightTextField: UITextField!
    @IBOutlet weak var todaysWeightMinusButton: UIButton!
    @IBOutlet weak var todaysWeightPlusButton: UIButton!
    @IBOutlet weak var addTodaysWeightButton: UIButton!
    
    
    @IBOutlet weak var specificDateWeightTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var specificWeightMinusButton: UIButton!
    @IBOutlet weak var specificWeightPlusButton: UIButton!
    @IBOutlet weak var addSpecificDateWeightButton: UIButton!
    
    
    //MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todaysWeightTextField.setCircleRadius()
        todaysWeightMinusButton.setCircleRadius()
        todaysWeightPlusButton.setCircleRadius()
        addTodaysWeightButton.setCircleRadius()
        
        specificDateWeightTextField.setCircleRadius()
        specificWeightMinusButton.setCircleRadius()
        specificWeightPlusButton.setCircleRadius()
        addSpecificDateWeightButton.setCircleRadius()
        
    }
    
    
    
    //MARK: Actions
    
    @IBAction func addTodaysWeightTextFieldEditingDidBegin(_ sender: UITextField) {
        
        todaysWeightTextField.text = defaultWeight
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
    
    
    @IBAction func addTodaysWeightButtonIsTouchedDown(_ sender: UIButton) {
        let currentValue: Double = Double(todaysWeightTextField.text ?? "") ?? 0
        let metric: WeightMetric = WeightMetric()
        let metrics: [WeightMetric] = Database.current.get()
        if let lastMetric: WeightMetric = metrics.sorted(by: { $0.created > $1.created }).first {
            metric.change = currentValue - lastMetric.value
        } else if let user: User = User.current {
            metric.change = currentValue - user.weight
        } else {
            metric.change = 0
        }
        metric.created = Date().timestamp
        metric.id = UUID().uuidString
        metric.value = currentValue
        
        Database.current.add(entity: metric) {
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
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
