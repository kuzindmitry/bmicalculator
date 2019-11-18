//
//  ViewController.swift
//  BMI
//
//  Created by Dmitry Kuzin on 23/08/2019.
//  Copyright © 2019 Dmitry Kuzin. All rights reserved.
//

import UIKit

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
    
    @IBOutlet weak var addTodaysWeightFromNextvcButton: UIButton! {
        didSet {
            addTodaysWeightFromNextvcButton.layer.cornerRadius = addTodaysWeightFromNextvcButton.frame.size.height / 5
        }
    }
    
    @IBAction func addTodaysWeightButtonTouchedDown(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toTodaysWeight", sender: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var metrics: [WeightMetric] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let today: Date = Date()
        let weekStartDate = today.startOfWeek.timestamp
        let weekEndDate = today.endOfWeek.timestamp
        
        let predicate = NSPredicate(format: "created >= %ld AND created < %ld ", weekStartDate, weekEndDate)
        metrics = Database.current.get(with: predicate)
        
        chartView.isCurved = true
        chartView.dataEntries = receiveUserDetails()
        chartView.backgroundColor = .clear
        
        let user = User.current
        goalLabel.text = "\(user?.weightGoal ?? 0)"
        weightMetricLabel.text = user?.weightMetrics.rawValue ?? ""
        
        
        
        
        
    }
    
    //MARK: Functions
    //FIXME: User's first weight input
    
    func receiveUserDetails() -> [PointEntry] {
        var result: [PointEntry] = []
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM"
        for metric in metrics {
            let date = Date(timeIntervalSince1970: TimeInterval(metric.created))
            let point = PointEntry(value: Int(metric.value), label: dateFormatter.string(from: date))
            result.append(point)
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

extension Date {
    var timestamp: Int64 {
        return Int64(self.timeIntervalSince1970)
    }
    var startOfWeek: Date {
        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 2
        let components = calendar.dateComponents([.weekOfYear, .yearForWeekOfYear], from: self)
        return calendar.date(from: components) ?? self
    }
    var endOfWeek: Date {
        var comps = DateComponents()
        comps.weekOfYear = 1
        comps.second = -1
        return Calendar.current.date(byAdding: comps, to: startOfWeek) ?? self
    }
}
