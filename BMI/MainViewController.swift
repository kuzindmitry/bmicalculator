//
//  ViewController.swift
//  BMI
//
//  Created by Dmitry Kuzin on 23/08/2019.
//  Copyright © 2019 Dmitry Kuzin. All rights reserved.
//

import UIKit
import RealmSwift

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
    
    //Outlets for correct appear settings
    @IBOutlet weak var userDetailsStackView: UIStackView!
    @IBOutlet weak var historyTableView: UITableView!
    @IBOutlet weak var ovalBMI: UIImageView!
    @IBOutlet weak var nameOfBlockCurrentWeight: UILabel!
    @IBOutlet weak var nameOfBlockGoal: UILabel!
    @IBOutlet weak var addTodaysWeightFromNextvcButton: UIButton!
    @IBOutlet weak var curvesExplanationStackView: UIStackView!
    @IBOutlet weak var leftCEStackView: UIStackView!
    
    @IBOutlet weak var leftOfLeftStackView: UIStackView!
    @IBOutlet weak var rightOfLeftStackView: UIStackView!
    @IBOutlet weak var leftOfRightStackView: UIStackView!
    @IBOutlet weak var rightOfRightStackView: UIStackView!
    
    
    
    @IBOutlet weak var rightCEStackView: UIStackView!
    @IBOutlet weak var firstCEword: UILabel!
    @IBOutlet weak var secondCEword: UILabel!
    @IBOutlet weak var thirdCEword: UILabel!
    @IBOutlet weak var fourthCEword: UILabel!
    @IBOutlet weak var firstCEline: UILabel!
    @IBOutlet weak var secondCEline: UILabel!
    @IBOutlet weak var thirdCEline: UILabel!
    @IBOutlet weak var fourthCEline: UILabel!
    
    
    
    
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
        
        self.view.addBackground()
        constraintsSizerDependingOnDevice()
        addTodaysWeightFromNextvcButton.layer.cornerRadius = addTodaysWeightFromNextvcButton.frame.size.height / 5
        
        chartView.isCurved = true
        chartView.backgroundColor = .clear
        
        updateContent()
    }
    
    func updateContent() {
        
        ///Chart View preparation
        let today: Date = Date()
//        let weekStartDate = today.dayBefore(numberOfDaysBefore: 7)
        let weekStartDate = today.startOfWeek
        let weekEndDate = today.endOfWeek
        
        let metricsSortedByDate = user?.metrics.sorted(by: { $0.created < $1.created })
        weekMetrics = metricsSortedByDate?.filter { $0.created >= weekStartDate && $0.created < weekEndDate } ?? []
        
        chartView.dataEntries = receiveUserDetails()
        
        let lastMetricValue = metricsSortedByDate?.last?.value ?? user?.weight
        weightMetricLabel.text = user?.weightMetricType.rawValue ?? ""
        currentWeightLabel.text = "\(lastMetricValue!)"
        goalLabel.text = "\(user?.weightGoal ?? 0)"
        let weightDifference: Double = (user?.weightGoal ?? 0) - ((lastMetricValue ?? user?.weight)!)
        if weightDifference >= 0 {
            remainLabel.text = "Your Goal is completed!"
        } else {
            remainLabel.text = String(format: "%.1f", weightDifference) + " " + "\(user?.weightMetricType.rawValue ?? "") remain"
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
    
    @IBAction func unwindSegueFromAddTodaysWeight(_ segue: UIStoryboardSegue) {
        //        guard let addVC = segue.source as? AddTodaysWeightViewController else {return}
//        let metrics = user?.metrics
//        let indexPath = IndexPath(row: (metrics?.count ?? 1) - 1, section: 0)
        DispatchQueue.main.async {
//            self.historyTableView.insertRows(at: , with: .fade)
            self.historyTableView.reloadData()
        }
    }
    
    @IBAction func unwindFromAddSpecialWeight(_ segue: UIStoryboardSegue) {
        //        guard let addVC = segue.source as? AddTodaysWeightViewController else {return}
//        let metrics = user?.metrics
//        let indexPath = IndexPath(row: (metrics?.count ?? 1) - 1, section: 0)
        DispatchQueue.main.async {
            

            self.historyTableView.reloadData()
//            self.historyTableView.
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let metrics = user?.metrics

        let tableViewAppearingMetrics = metrics?.count ?? 0
        
        return tableViewAppearingMetrics
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let user = User.current
        let metric: WeightMetric = WeightMetric()
        let metrics = user?.metrics
        let totalRows = tableView.numberOfRows(inSection: indexPath.section)
        
        if let byDateSortedMetricsArray = metrics?.sorted(by: { $0.created > $1.created }) {
            
            if indexPath.row == totalRows - 1 {
                metric.change = 0
            } else {
                metric.change = byDateSortedMetricsArray[indexPath.row].value
                    - byDateSortedMetricsArray[indexPath.row + 1].value
            }
            metric.created = byDateSortedMetricsArray[indexPath.row].created
            metric.value = byDateSortedMetricsArray[indexPath.row].value
            metric.id = byDateSortedMetricsArray[indexPath.row].id
            
        }
        
        
        let df = DateFormatter()
        df.dateFormat = "EEEE"
        cell.weekdayLabel.text = df.string(from: metric.created)
        df.dateFormat = "MMMM, dd"
        cell.dayLabel.text = df.string(from: metric.created)
        cell.observedWeightLabel.text = String(format: "%.1f", metric.value)
        
        cell.weightDifferenceLabel.text = String(format: "%.1f", metric.change)
        cell.selectedWeightMetric.text = user?.weightMetricType.rawValue
        
        
        print("Count of metrics is \(metrics!.count)")
        print("Count of change is \(metric.change)")
        switch metric.change {
        case let x where x<0 :
            cell.weightArrowImage.image = #imageLiteral(resourceName: "weightDownArrow")
        case let x where x>0 :
            cell.weightArrowImage.image = #imageLiteral(resourceName: "weightUpArrow")
        case 0:
            cell.weightArrowImage.image = nil
        default:
            print("Unknown value")
        }
        
        
        
        // switching font sizes inside the cell depending on device
        switch UIScreen.main.bounds.size.height {
        //iphone SE/5/5c
        case 568:
            guard let weightArrow = cell.weightArrowImage, let weightDifferenceLabel = cell.weightDifferenceLabel else { return UITableViewCell() }
            NSLayoutConstraint(item: cell.contentView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60).isActive = true
            NSLayoutConstraint(item: weightArrow, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: weightArrow, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: weightDifferenceLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 34).isActive = true
            
            NSLayoutConstraint(item: weightDifferenceLabel, attribute: .trailing, relatedBy: .equal, toItem: cell.contentView, attribute: .trailing, multiplier: 1, constant:  -35).isActive = true
            NSLayoutConstraint(item: weightArrow, attribute: .trailing, relatedBy: .equal, toItem: weightDifferenceLabel, attribute: .leadingMargin, multiplier: 1, constant: -15).isActive = true
            cell.dayLabel.font = UIFont.systemFont(ofSize: 16)
            cell.weekdayLabel.font = UIFont.systemFont(ofSize: 16)
            cell.observedWeightLabel.font = UIFont.systemFont(ofSize: 16)
            cell.selectedWeightMetric.font = UIFont.systemFont(ofSize: 16)
            cell.weightDifferenceLabel.font = UIFont.systemFont(ofSize: 16)
        // iPhone 8/7/6s/6
        case 667:
            guard let weightArrow = cell.weightArrowImage, let weightDifferenceLabel = cell.weightDifferenceLabel else { return UITableViewCell() }
            NSLayoutConstraint(item: cell.contentView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 75).isActive = true
            NSLayoutConstraint(item: weightArrow, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: weightArrow, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: weightDifferenceLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
            NSLayoutConstraint(item: weightDifferenceLabel, attribute: .trailing, relatedBy: .equal, toItem: cell.contentView, attribute: .trailing, multiplier: 1, constant:  -45).isActive = true
            NSLayoutConstraint(item: weightArrow, attribute: .trailing, relatedBy: .equal, toItem: weightDifferenceLabel, attribute: .leadingMargin, multiplier: 1, constant: -15).isActive = true
            cell.dayLabel.font = UIFont.systemFont(ofSize: 19)
            cell.weekdayLabel.font = UIFont.systemFont(ofSize: 19)
            cell.observedWeightLabel.font = UIFont.systemFont(ofSize: 19)
            cell.selectedWeightMetric.font = UIFont.systemFont(ofSize: 19)
            cell.weightDifferenceLabel.font = UIFont.systemFont(ofSize: 19)
            
        // iPhone 8+, 7+, 6s+, 6+
        case 736:
            guard let weightArrow = cell.weightArrowImage, let weightDifferenceLabel = cell.weightDifferenceLabel else { return UITableViewCell() }
            NSLayoutConstraint(item: cell.contentView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 75).isActive = true
            NSLayoutConstraint(item: weightArrow, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: weightArrow, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: weightDifferenceLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
            NSLayoutConstraint(item: weightDifferenceLabel, attribute: .trailing, relatedBy: .equal, toItem: cell.contentView, attribute: .trailing, multiplier: 1, constant:  -45).isActive = true
            NSLayoutConstraint(item: weightArrow, attribute: .trailing, relatedBy: .equal, toItem: weightDifferenceLabel, attribute: .leadingMargin, multiplier: 1, constant: -15).isActive = true
            cell.dayLabel.font = UIFont.systemFont(ofSize: 19)
            cell.weekdayLabel.font = UIFont.systemFont(ofSize: 19)
            cell.observedWeightLabel.font = UIFont.systemFont(ofSize: 19)
            cell.selectedWeightMetric.font = UIFont.systemFont(ofSize: 19)
            cell.weightDifferenceLabel.font = UIFont.systemFont(ofSize: 19)
            
        // iPhone 11 Pro, X, Xs
        case 812:
            
            guard let weightArrow = cell.weightArrowImage, let weightDifferenceLabel = cell.weightDifferenceLabel else { return UITableViewCell() }
            NSLayoutConstraint(item: cell.contentView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 75).isActive = true
            NSLayoutConstraint(item: weightArrow, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: weightArrow, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: weightDifferenceLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
            NSLayoutConstraint(item: weightDifferenceLabel, attribute: .trailing, relatedBy: .equal, toItem: cell.contentView, attribute: .trailing, multiplier: 1, constant:  -35).isActive = true
            NSLayoutConstraint(item: weightArrow, attribute: .trailing, relatedBy: .equal, toItem: weightDifferenceLabel, attribute: .leadingMargin, multiplier: 1, constant: -15).isActive = true
            cell.dayLabel.font = UIFont.systemFont(ofSize: 19)
            cell.weekdayLabel.font = UIFont.systemFont(ofSize: 19)
            cell.observedWeightLabel.font = UIFont.systemFont(ofSize: 19)
            cell.selectedWeightMetric.font = UIFont.systemFont(ofSize: 19)
            cell.weightDifferenceLabel.font = UIFont.systemFont(ofSize: 19)
            
        // iPhone 11 Pro Max/Xs Max/11/Xr
        case 896:
            
            guard let weightArrow = cell.weightArrowImage, let weightDifferenceLabel = cell.weightDifferenceLabel else { return UITableViewCell() }
            NSLayoutConstraint(item: cell.contentView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 75).isActive = true
            NSLayoutConstraint(item: weightArrow, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: weightArrow, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: weightDifferenceLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 55).isActive = true
            NSLayoutConstraint(item: weightDifferenceLabel, attribute: .trailing, relatedBy: .equal, toItem: cell.contentView, attribute: .trailing, multiplier: 1, constant:  -20).isActive = true
            NSLayoutConstraint(item: weightArrow, attribute: .trailing, relatedBy: .equal, toItem: weightDifferenceLabel, attribute: .leadingMargin, multiplier: 1, constant: -15).isActive = true
            cell.dayLabel.font = UIFont.systemFont(ofSize: 22)
            cell.weekdayLabel.font = UIFont.systemFont(ofSize: 22)
            cell.observedWeightLabel.font = UIFont.systemFont(ofSize: 22)
            cell.selectedWeightMetric.font = UIFont.systemFont(ofSize: 22)
            cell.weightDifferenceLabel.font = UIFont.systemFont(ofSize: 22)
            
        default:
            print("Unknown device")
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
