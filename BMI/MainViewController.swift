//
//  ViewController.swift
//  BMI
//
//  Created by Dmitry Kuzin on 23/08/2019.
//  Copyright © 2019 Dmitry Kuzin. All rights reserved.
//

import UIKit

//MARK: Main VC Class

class MainViewController: UIViewController {

    //MARK: Outlets
    
    @IBOutlet weak var chartView: ChartView!
    
    @IBOutlet weak var curvesExplanation: UIView!
    
    @IBOutlet weak var goalView: UIView!
    
    @IBOutlet weak var currentWeightView: UIView!
    
    @IBOutlet weak var goalLabel: UILabel! 
    
    @IBOutlet weak var weightMetricLabel: UILabel!

    @IBOutlet weak var currentWeightLabel: UILabel!
    
    @IBOutlet weak var remainLabel: UILabel!
    
    @IBOutlet weak var historyTableView: UITableView!
    
    @IBOutlet weak var addWeightButton: UIButton! {
        didSet {
            addWeightButton.layer.cornerRadius = addWeightButton.frame.size.height / 5
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chartView.isCurved = true
        chartView.dataEntries = generateRandomData()
//            receiveUserDetails()
//            generateRandomData()
        chartView.backgroundColor = .clear
        
    }
    
    func receiveUserDetails() -> [PointEntry] {
        var result: [PointEntry] = []
        
        for i in 0..<100 {
        
        let value = Double(User.current!.weight)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        var date = Date()
        date.addTimeInterval(TimeInterval(24*60*60*i))
            result.append(PointEntry(value: Int(value), label: formatter.string(from: date)))
            
       }
        
        return result
    }
    
    func generateRandomData() -> [PointEntry] {
        var result: [PointEntry] = []
        for i in 0..<100 {
            let value = Int(arc4random() % 500)
            
            let formatter = DateFormatter()
            formatter.dateFormat = "d MMM"
            var date = Date()
            date.addTimeInterval(TimeInterval(24*60*60*i))
            
            result.append(PointEntry(value: value, label: formatter.string(from: date)))
        }
        return result
    }


}
