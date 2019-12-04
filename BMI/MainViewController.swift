//
//  ViewController.swift
//  BMI
//
//  Created by Dmitry Kuzin on 23/08/2019.
//  Copyright © 2019 Dmitry Kuzin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    //MARK: Outlets
    
    @IBOutlet weak var chartView: ChartView!
    @IBOutlet weak var curvesExplanation: UIView!
    
    @IBOutlet weak var goalView: UIView!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var weightMetricLabel: UILabel!
    
    @IBOutlet weak var currentWeightView: UIView!
    @IBOutlet weak var currentWeightLabel: UILabel!
    @IBOutlet weak var remainLabel: UILabel!


    
    @IBOutlet weak var addTodaysWeightFromNextvcButton: UIButton!
    
    @IBAction func addTodaysWeightButtonTouchedDown(_ sender: UIButton) {
        performSegue(withIdentifier: "toTodaysWeight", sender: nil)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        
    }
    
    var metrics: [WeightMetric] = []
    

    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTodaysWeightFromNextvcButton.layer.cornerRadius = addTodaysWeightFromNextvcButton.frame.size.height / 5
        
        ///Chart View preparation
        let today: Date = Date()
        let weekStartDate = today.startOfWeek.timestamp
        let weekEndDate = today.endOfWeek.timestamp
        
        let predicate = NSPredicate(format: "created >= %ld AND created < %ld ", weekStartDate, weekEndDate)
        metrics = Database.current.get(with: predicate)
        
        chartView.isCurved = true
        chartView.dataEntries = receiveUserDetails()
        chartView.backgroundColor = .clear
        
        ///Weight Goal block
        let user = User.current
        goalLabel.text = "\(user?.weightGoal ?? 0)"
        weightMetricLabel.text = user?.weightMetrics.rawValue ?? ""
        
        ///Current Weight block
        currentWeightLabel.text = "\(user?.weight ?? 0)"
        let weightDifference: Double = ((user?.weightGoal ?? 0) - (user?.weight ?? 0))
        remainLabel.text = "\(weightDifference) \(user?.weightMetrics.rawValue ?? "") remain"
        if weightDifference > 0 {
            remainLabel.text = "Your Weight Goal is completed! Congratulations!"
        }
        
    }
    
    //MARK: Functions
    
    //Table View Update
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user = User.current
        let df = DateFormatter()
        let date = Date()
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        df.dateFormat = "EEEE"
        cell.weekdayLabel.text = df.string(from: date.dayBefore(numberOfDaysBefore: indexPath.row))
        
        df.dateFormat = "MMMM, dd"
        cell.dayLabel.text = df.string(from: date.dayBefore(numberOfDaysBefore: indexPath.row))
        
//        cell.observedWeightLabel.te
        
//        cell.observedWeightLabel.text = "\(user?.weight ?? 0)"
        
        cell.selectedWeightMetric.text = user?.weightMetrics.rawValue ?? ""
        
        return cell
    }
    
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

//MARK: Extensions



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
    
    func dayBefore(numberOfDaysBefore: Int) -> Date {
        
        var dateComponents = DateComponents()
        
        if numberOfDaysBefore >= 1 {
            dateComponents.setValue(-numberOfDaysBefore, for: .day) // -1 day
        }

        let now = Date() // Current date
        let dayBefore = Calendar.current.date(byAdding: dateComponents, to: now) // Add the DateComponents

        return dayBefore!
    }

}
