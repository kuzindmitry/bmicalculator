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
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var weightMetricLabel: UILabel!
    
    @IBOutlet weak var currentWeightView: UIView!
    @IBOutlet weak var currentWeightLabel: UILabel!
    @IBOutlet weak var remainLabel: UILabel!
    
    
    
    @IBOutlet weak var addTodaysWeightFromNextvcButton: UIButton!
    
    @IBAction func addTodaysWeightButtonTouchedDown(_ sender: UIButton) {
        performSegue(withIdentifier: "toTodaysWeight", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTodaysWeight" {
            let vc = segue.destination as! AddTodaysWeightViewController
            vc.delegate = self
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        
    }
    
    var user = User.current
    var weekMetrics: [WeightMetric] = []
    //    var userEntityItems: [UserEntity] = []
    
    
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTodaysWeightFromNextvcButton.layer.cornerRadius = addTodaysWeightFromNextvcButton.frame.size.height / 5

        
        chartView.isCurved = true
        chartView.backgroundColor = .clear
        
        
        updateContent()
    }
    
    func updateContent() {
        
        weightMetricLabel.text = user?.weightMetricType.rawValue ?? ""
        
        getWeightGoal()
        
        ///Chart View preparation
        let today: Date = Date()
        let weekStartDate = today.startOfWeek
        let weekEndDate = today.endOfWeek
        
        weekMetrics = user?.metrics.filter { $0.created >= weekStartDate && $0.created < weekEndDate } ?? []
        
        chartView.dataEntries = receiveUserDetails()
        currentWeightLabel.text = "\(user?.weight ?? 0)"
        let weightDifference: Double = (user?.weightGoal ?? 0) - (user?.weight ?? 0)
        remainLabel.text = String(format: "%.1f", weightDifference) + " " + "\(user?.weightMetricType.rawValue ?? "") remain"
        if weightDifference > 0 {
            remainLabel.text = "Your Goal is completed!"
        }
        
    }
    
    
    
    //MARK: Functions
    
    func receiveUserDetails() -> [PointEntry] {
        var result: [PointEntry] = []
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM"
        for metric in weekMetrics {
            let point = PointEntry(value: Int(metric.value), label: dateFormatter.string(from: metric.created))
            result.append(point)
        }
        
        return result
    }
    //FIXME: Get Weight Goal
    func getWeightGoal()  {
        guard let user = User.current else { return }
        goalLabel.text = "\(user.weightGoal)"
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


extension MainViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let metrics = user?.metrics
        let tableViewAppearingMetrics = metrics?.sorted(by: { $0.created > $1.created }).count ?? 0
        
        if tableViewAppearingMetrics > 0 {
            tableViewAppearingMetrics
        }
        
        return tableViewAppearingMetrics
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let user = User.current
        
        let metric: WeightMetric = WeightMetric()
        let metrics = user?.metrics
        
        let startingMetric = metrics?.sorted(by: { $0.created > $1.created }).count ?? 0
        print(startingMetric)
        if startingMetric < indexPath.row {
            metric.created = Date()
            metric.value = user?.weight ?? 0
            metric.change = 0
        }
        
        if startingMetric > indexPath.row, let lastMetric: WeightMetric = metrics?.sorted(by: { $0.created > $1.created })[indexPath.row] {
                metric.created = lastMetric.created
                metric.change = lastMetric.change
                metric.value = lastMetric.value
                metric.id = lastMetric.id
            } else if let user: User = User.current {
                metric.value = user.weight
                metric.change = 0
                metric.created = Date()
            }
        
        let df = DateFormatter()
        df.dateFormat = "EEEE"
        cell.weekdayLabel.text = df.string(from: metric.created)
        df.dateFormat = "MMMM, dd"
        cell.dayLabel.text = df.string(from: metric.created)
        cell.observedWeightLabel.text = String(format: "%.1f", metric.value)
        cell.weightDifferenceLabel.text = String(format: "%.1f", metric.change)
        cell.selectedWeightMetric.text = user?.weightMetricType.rawValue
        
        switch metric.change {
        case ...0 :
            cell.weightArrowImage.image = #imageLiteral(resourceName: "weightDownArrow")
        case 0... :
            cell.weightArrowImage.image = #imageLiteral(resourceName: "weightUpArrow")
        case 0:
            cell.weightArrowImage.image = #imageLiteral(resourceName: "weightUpArrow")
            cell.weightArrowImage.alpha = 0
        default:
            print("Unknown value")
        }
        return cell
    }
}

extension MainViewController: AddTodaysWeightViewControllerDelegate {
    
    func addTodaysWeightViewController(_ controller: AddTodaysWeightViewController, didAddMetricForUser user: User) {
        self.user = user
        updateContent()
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

extension MainViewController {
    
    func toString() -> String {
        return String(format: "%.1f",self)
    }
    
    
}
