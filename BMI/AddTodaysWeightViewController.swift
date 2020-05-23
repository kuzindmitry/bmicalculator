//
//  AddTodaysWeightViewController.swift
//  BMI
//
//  Created by Alexey Mefodyev on 04/10/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import UIKit

protocol AddTodaysWeightViewControllerDelegate: class {
    func addTodaysWeightViewController(_ controller: AddTodaysWeightViewController, didAddMetricForUser user: User)
}

class AddTodaysWeightViewController : UIViewController {
    
    weak var delegate: AddTodaysWeightViewControllerDelegate?
    
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
    
    @IBOutlet weak var tableView: UITableView!
    
    //Outlets for correct appearance settings
    @IBOutlet weak var whatsYourWeightLabel: UILabel!
    
    @IBOutlet weak var upperWeightView: UIView!
    
    @IBOutlet weak var useLowerLabel: UILabel!
    
    @IBOutlet weak var myWeightAtLabel: UILabel!
    
    @IBOutlet weak var wasLabel: UILabel!
    
    @IBOutlet weak var lowerWeightView: UIView!
    
    //MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addBackground()
        
        
        constraintsSizerDependingOnDevice()
        
        
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
        addMetric(with: currentValue, for: Date())
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
        let specificDateValue: Double = Double(specificDateWeightTextField.text ?? "") ?? 0
        addMetric(with: specificDateValue, for: datePicker.date)

    }
    

}

//MARK: Extensions

extension AddTodaysWeightViewController {
    
    func addMetric(with value: Double, for date: Date) {
        guard let user = User.current else { return }
        let metric: WeightMetric = WeightMetric()
//        let metrics = user.metrics
        let copiedUser = User(value: user)
        
        metric.value = value
        metric.created = date
        copiedUser.metrics.append(metric)
        
//        if let lastMetric = copiedUser.metrics.sorted(by: { $0.created > $1.created }).first {
//            copiedUser.weight = lastMetric.value
//        }
        Database.current.add(copiedUser, success: { [weak self] in
            DispatchQueue.main.async {
                if let `self` = self {
                    self.delegate?.addTodaysWeightViewController(self, didAddMetricForUser: copiedUser)
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }, failure: { error in
            print(error?.localizedDescription ?? "none")
        })
        
    }
    
    @objc func timerDecreaseAction() {
        
        let defaultWeightNumber: Double = Double(todaysWeightTextField.text!) ?? 50.0
        let decreaseWeight: Double = -0.1
        let decreasedWeightResult = defaultWeightNumber + decreaseWeight
        todaysWeightTextField.text = String(format: "%.1f", decreasedWeightResult)
        
    }
    
    @objc func timerIncreaseAction() {
        
        let defaultWeightNumber: Double = Double(todaysWeightTextField.text!) ?? 50.0
        let increaseWeight: Double = 0.1
        let increasedWeightResult = defaultWeightNumber + increaseWeight
        todaysWeightTextField.text = String(format: "%.1f", increasedWeightResult)
        
    }
    
    @objc func specificDateTimerDecreaseAction() {
        
        let defaultWeightNumber: Double = Double(specificDateWeightTextField.text!) ?? 50.0
        let decreaseWeight: Double = -0.1
        let decreasedWeightResult = defaultWeightNumber + decreaseWeight
        specificDateWeightTextField.text = String(format: "%.1f", decreasedWeightResult)
        
    }
    
    @objc func specificDateTimerIncreaseAction() {
        
        let defaultWeightNumber: Double = Double(specificDateWeightTextField.text!) ?? 50.0
        let increaseWeight: Double = 0.1
        let increasedWeightResult = defaultWeightNumber + increaseWeight
        specificDateWeightTextField.text = String(format: "%.1f", increasedWeightResult)
        
    }
    
}

