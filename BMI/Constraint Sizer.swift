//
//  ConstraintSizer.swift
//  BMI
//
//  Created by Alexey Mefodyev on 05.02.2020.
//  Copyright © 2020 Super Developers. All rights reserved.
//

import UIKit

extension MainViewController {
    
    func constraintsSizerDependingOnDevice() {
        
        switch UIScreen.main.bounds.size.height {
        case 568:
            print("Start screen sizing for iPhone SE/5/5c")
            
            
            guard let addTodaysWeightButton = addTodaysWeightFromNextvcButton, let chartView = chartView, let curvesExplanation = curvesExplanation, let userDetailsStackView = userDetailsStackView, let historyTableView = historyTableView, let ovalBMI = ovalBMI else {
                return
            }
            addTodaysWeightButton.translatesAutoresizingMaskIntoConstraints = false
            chartView.translatesAutoresizingMaskIntoConstraints = false
            curvesExplanation.translatesAutoresizingMaskIntoConstraints = false
            userDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
            historyTableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .width, relatedBy: .equal, toItem: addTodaysWeightButton, attribute: .height, multiplier: 1.0/1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .width, relatedBy: .equal, toItem: addTodaysWeightButton, attribute: .height, multiplier: 0, constant: 35).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 5).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 10).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .bottom, relatedBy: .equal, toItem: chartView, attribute: .topMargin, multiplier: 1, constant: 5).isActive = true
            
            NSLayoutConstraint(item: chartView, attribute: .top, relatedBy: .equal, toItem: addTodaysWeightButton, attribute: .bottomMargin, multiplier: 1, constant: 5).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.size.width).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 160).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .bottom, relatedBy: .equal, toItem: curvesExplanation, attribute: .topMargin, multiplier: 1, constant: -15).isActive = true
            
            NSLayoutConstraint(item: curvesExplanation, attribute: .top, relatedBy: .equal, toItem: chartView, attribute: .bottomMargin, multiplier: 1, constant: -15).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.size.width).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 55).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 10).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 5).isActive = true
            curvesExplanationStackView.spacing = 10
            leftCEStackView.spacing = 5
            rightCEStackView.spacing = 5
            leftOfLeftStackView.spacing = 5
            rightOfLeftStackView.spacing = 5
            leftOfRightStackView.spacing = 5
            rightOfRightStackView.spacing = 5
            firstCEword.font = UIFont.systemFont(ofSize: 16)
            firstCEline.font = UIFont.systemFont(ofSize: 18)
            secondCEword.font = UIFont.systemFont(ofSize: 16)
            secondCEline.font = UIFont.systemFont(ofSize: 18)
            thirdCEword.font = UIFont.systemFont(ofSize: 16)
            thirdCEline.font = UIFont.systemFont(ofSize: 18)
            fourthCEword.font = UIFont.systemFont(ofSize: 16)
            fourthCEline.font = UIFont.systemFont(ofSize: 18)
            
            
            NSLayoutConstraint(item: userDetailsStackView, attribute: .top, relatedBy: .equal, toItem: curvesExplanation, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
            userDetailsStackView.spacing = 12
            NSLayoutConstraint(item: userDetailsStackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 175).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (UIScreen.main.bounds.size.width)-20).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 10).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 5).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .bottom, relatedBy: .equal, toItem: historyTableView, attribute: .topMargin, multiplier: 1, constant: -15).isActive = true
            NSLayoutConstraint(item: ovalBMI, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 115).isActive = true
            NSLayoutConstraint(item: ovalBMI, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 170).isActive = true
            nameOfBlockGoal.font = UIFont.systemFont(ofSize: 16)
            nameOfBlockCurrentWeight.font = UIFont.systemFont(ofSize: 16)
            goalLabel.font = UIFont.systemFont(ofSize: 35)
            weightMetricLabel.font = UIFont.systemFont(ofSize: 18)
            currentWeightLabel.font = UIFont.systemFont(ofSize: 35)
            remainLabel.font = UIFont.systemFont(ofSize: 18)
            
            
            NSLayoutConstraint(item: historyTableView, attribute: .top, relatedBy: .equal, toItem: userDetailsStackView, attribute: .bottomMargin, multiplier: 1, constant: -15).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.size.width).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 10).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 5).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
            
        case 667:
            print("Start screen sizing for iPhone 8/7/6s/6")
            
            guard let addTodaysWeightButton = addTodaysWeightFromNextvcButton, let chartView = chartView, let curvesExplanation = curvesExplanation, let userDetailsStackView = userDetailsStackView, let historyTableView = historyTableView else {
                return
            }
            addTodaysWeightButton.translatesAutoresizingMaskIntoConstraints = false
            chartView.translatesAutoresizingMaskIntoConstraints = false
            curvesExplanation.translatesAutoresizingMaskIntoConstraints = false
            userDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
            historyTableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .width, relatedBy: .equal, toItem: addTodaysWeightButton, attribute: .height, multiplier: 1.0/1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .width, relatedBy: .equal, toItem: addTodaysWeightButton, attribute: .height, multiplier: 0, constant: 42).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 10).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .bottom, relatedBy: .equal, toItem: chartView, attribute: .topMargin, multiplier: 1, constant: 5).isActive = true
            
            NSLayoutConstraint(item: chartView, attribute: .top, relatedBy: .equal, toItem: addTodaysWeightButton, attribute: .bottomMargin, multiplier: 1, constant: 5).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.size.width).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 220).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .bottom, relatedBy: .equal, toItem: curvesExplanation, attribute: .topMargin, multiplier: 1, constant: -15).isActive = true
            
            
            NSLayoutConstraint(item: curvesExplanation, attribute: .top, relatedBy: .equal, toItem: chartView, attribute: .bottomMargin, multiplier: 1, constant: -15).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.size.width).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 65).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 15).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
            curvesExplanationStackView.spacing = 7
            leftCEStackView.spacing = 7
            rightCEStackView.spacing = 7
            leftOfLeftStackView.spacing = 5
            rightOfLeftStackView.spacing = 5
            leftOfRightStackView.spacing = 5
            rightOfRightStackView.spacing = 5
            firstCEword.font = UIFont.systemFont(ofSize: 18)
            firstCEline.font = UIFont.systemFont(ofSize: 22)
            secondCEword.font = UIFont.systemFont(ofSize: 18)
            secondCEline.font = UIFont.systemFont(ofSize: 22)
            thirdCEword.font = UIFont.systemFont(ofSize: 18)
            thirdCEline.font = UIFont.systemFont(ofSize: 22)
            fourthCEword.font = UIFont.systemFont(ofSize: 18)
            fourthCEline.font = UIFont.systemFont(ofSize: 22)
            
            NSLayoutConstraint(item: userDetailsStackView, attribute: .top, relatedBy: .equal, toItem: curvesExplanation, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
            userDetailsStackView.spacing = 12
            NSLayoutConstraint(item: userDetailsStackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (UIScreen.main.bounds.size.width)-20).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 15).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .bottom, relatedBy: .equal, toItem: historyTableView, attribute: .topMargin, multiplier: 1, constant: -15).isActive = true
            nameOfBlockGoal.font = UIFont.systemFont(ofSize: 17)
            nameOfBlockCurrentWeight.font = UIFont.systemFont(ofSize: 17)
            goalLabel.font = UIFont.systemFont(ofSize: 40)
            weightMetricLabel.font = UIFont.systemFont(ofSize: 19)
            currentWeightLabel.font = UIFont.systemFont(ofSize: 40)
            remainLabel.font = UIFont.systemFont(ofSize: 19)
            
            NSLayoutConstraint(item: historyTableView, attribute: .top, relatedBy: .equal, toItem: userDetailsStackView, attribute: .bottomMargin, multiplier: 1, constant: -15).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.size.width).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 15).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
            
        case 736:
            print("Start screen sizing for iPhone 8+, 7+, 6s+, 6+")
            
            guard let addTodaysWeightButton = addTodaysWeightFromNextvcButton, let chartView = chartView, let curvesExplanation = curvesExplanation, let userDetailsStackView = userDetailsStackView, let historyTableView = historyTableView, let ovalBMI = ovalBMI else {
                return
            }
            addTodaysWeightButton.translatesAutoresizingMaskIntoConstraints = false
            chartView.translatesAutoresizingMaskIntoConstraints = false
            curvesExplanation.translatesAutoresizingMaskIntoConstraints = false
            userDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
            historyTableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .width, relatedBy: .equal, toItem: addTodaysWeightButton, attribute: .height, multiplier: 1.0/1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .width, relatedBy: .equal, toItem: addTodaysWeightButton, attribute: .height, multiplier: 0, constant: 42).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 10).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .bottom, relatedBy: .equal, toItem: chartView, attribute: .topMargin, multiplier: 1, constant: 5).isActive = true
            
            NSLayoutConstraint(item: chartView, attribute: .top, relatedBy: .equal, toItem: addTodaysWeightButton, attribute: .bottomMargin, multiplier: 1, constant: 5).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.size.width).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 230).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .bottom, relatedBy: .equal, toItem: curvesExplanation, attribute: .topMargin, multiplier: 1, constant: -20).isActive = true
            
            
            NSLayoutConstraint(item: curvesExplanation, attribute: .top, relatedBy: .equal, toItem: chartView, attribute: .bottomMargin, multiplier: 1, constant: -15).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.size.width).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 70).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 15).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
            curvesExplanationStackView.spacing = 7
            leftCEStackView.spacing = 7
            rightCEStackView.spacing = 7
            leftOfLeftStackView.spacing = 5
            rightOfLeftStackView.spacing = 5
            leftOfRightStackView.spacing = 5
            rightOfRightStackView.spacing = 5
            firstCEword.font = UIFont.systemFont(ofSize: 20)
            firstCEline.font = UIFont.systemFont(ofSize: 22)
            secondCEword.font = UIFont.systemFont(ofSize: 20)
            secondCEline.font = UIFont.systemFont(ofSize: 22)
            thirdCEword.font = UIFont.systemFont(ofSize: 20)
            thirdCEline.font = UIFont.systemFont(ofSize: 22)
            fourthCEword.font = UIFont.systemFont(ofSize: 20)
            fourthCEline.font = UIFont.systemFont(ofSize: 22)
            
            NSLayoutConstraint(item: userDetailsStackView, attribute: .top, relatedBy: .equal, toItem: curvesExplanation, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
            userDetailsStackView.spacing = 20
            NSLayoutConstraint(item: userDetailsStackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 220).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (UIScreen.main.bounds.size.width)-20).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .bottom, relatedBy: .equal, toItem: historyTableView, attribute: .topMargin, multiplier: 1, constant: -10).isActive = true
            NSLayoutConstraint(item: ovalBMI, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 160).isActive = true
            nameOfBlockGoal.font = UIFont.systemFont(ofSize: 19)
            nameOfBlockCurrentWeight.font = UIFont.systemFont(ofSize: 19)
            goalLabel.font = UIFont.systemFont(ofSize: 40)
            weightMetricLabel.font = UIFont.systemFont(ofSize: 19)
            currentWeightLabel.font = UIFont.systemFont(ofSize: 40)
            remainLabel.font = UIFont.systemFont(ofSize: 19)
            
            
            NSLayoutConstraint(item: historyTableView, attribute: .top, relatedBy: .equal, toItem: userDetailsStackView, attribute: .bottomMargin, multiplier: 1, constant: -15).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.size.width).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
            
        case 812:
            print("Start screen sizing for iPhone 11 Pro/X/Xs")
            
            guard let addTodaysWeightButton = addTodaysWeightFromNextvcButton, let chartView = chartView, let curvesExplanation = curvesExplanation, let userDetailsStackView = userDetailsStackView, let historyTableView = historyTableView, let ovalBMI = ovalBMI else {
                return
            }
            addTodaysWeightButton.translatesAutoresizingMaskIntoConstraints = false
            chartView.translatesAutoresizingMaskIntoConstraints = false
            curvesExplanation.translatesAutoresizingMaskIntoConstraints = false
            userDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
            historyTableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .width, relatedBy: .equal, toItem: addTodaysWeightButton, attribute: .height, multiplier: 1.0/1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .width, relatedBy: .equal, toItem: addTodaysWeightButton, attribute: .height, multiplier: 0, constant: 42).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 5).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 10).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .bottom, relatedBy: .equal, toItem: chartView, attribute: .topMargin, multiplier: 1, constant: 5).isActive = true
            
            NSLayoutConstraint(item: chartView, attribute: .top, relatedBy: .equal, toItem: addTodaysWeightButton, attribute: .bottomMargin, multiplier: 1, constant: 5).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.size.width).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 240).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .bottom, relatedBy: .equal, toItem: curvesExplanation, attribute: .topMargin, multiplier: 1, constant: -20).isActive = true
            
            
            NSLayoutConstraint(item: curvesExplanation, attribute: .top, relatedBy: .equal, toItem: chartView, attribute: .bottomMargin, multiplier: 1, constant: -15).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.size.width).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 70).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 15).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
            curvesExplanationStackView.spacing = 7
            leftCEStackView.spacing = 7
            rightCEStackView.spacing = 7
            leftOfLeftStackView.spacing = 5
            rightOfLeftStackView.spacing = 5
            leftOfRightStackView.spacing = 5
            rightOfRightStackView.spacing = 5
            firstCEword.font = UIFont.systemFont(ofSize: 19)
            firstCEline.font = UIFont.systemFont(ofSize: 22)
            secondCEword.font = UIFont.systemFont(ofSize: 19)
            secondCEline.font = UIFont.systemFont(ofSize: 22)
            thirdCEword.font = UIFont.systemFont(ofSize: 19)
            thirdCEline.font = UIFont.systemFont(ofSize: 22)
            fourthCEword.font = UIFont.systemFont(ofSize: 19)
            fourthCEline.font = UIFont.systemFont(ofSize: 22)
            
            NSLayoutConstraint(item: userDetailsStackView, attribute: .top, relatedBy: .equal, toItem: curvesExplanation, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
            userDetailsStackView.spacing = 20
            NSLayoutConstraint(item: userDetailsStackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 220).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (UIScreen.main.bounds.size.width)-20).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .bottom, relatedBy: .equal, toItem: historyTableView, attribute: .topMargin, multiplier: 1, constant: -10).isActive = true
            NSLayoutConstraint(item: ovalBMI, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 160).isActive = true
            nameOfBlockGoal.font = UIFont.systemFont(ofSize: 19)
            nameOfBlockCurrentWeight.font = UIFont.systemFont(ofSize: 19)
            goalLabel.font = UIFont.systemFont(ofSize: 40)
            weightMetricLabel.font = UIFont.systemFont(ofSize: 19)
            currentWeightLabel.font = UIFont.systemFont(ofSize: 40)
            remainLabel.font = UIFont.systemFont(ofSize: 19)
            
            
            NSLayoutConstraint(item: historyTableView, attribute: .top, relatedBy: .equal, toItem: userDetailsStackView, attribute: .bottomMargin, multiplier: 1, constant: -15).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.size.width).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 35).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
            
            
        case 896:
            print("Start screen sizing for iPhone 11 Pro Max/Xs Max/11/Xr")
            
            guard let addTodaysWeightButton = addTodaysWeightFromNextvcButton, let chartView = chartView, let curvesExplanation = curvesExplanation, let userDetailsStackView = userDetailsStackView, let historyTableView = historyTableView, let ovalBMI = ovalBMI else {
                return
            }
            addTodaysWeightButton.translatesAutoresizingMaskIntoConstraints = false
            chartView.translatesAutoresizingMaskIntoConstraints = false
            curvesExplanation.translatesAutoresizingMaskIntoConstraints = false
            userDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
            historyTableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .width, relatedBy: .equal, toItem: addTodaysWeightButton, attribute: .height, multiplier: 1.0/1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .width, relatedBy: .equal, toItem: addTodaysWeightButton, attribute: .height, multiplier: 0, constant: 42).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 10).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 10).isActive = true
            NSLayoutConstraint(item: addTodaysWeightButton, attribute: .bottom, relatedBy: .equal, toItem: chartView, attribute: .topMargin, multiplier: 1, constant: 5).isActive = true
            
            NSLayoutConstraint(item: chartView, attribute: .top, relatedBy: .equal, toItem: addTodaysWeightButton, attribute: .bottomMargin, multiplier: 1, constant: 5).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.size.width).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 325).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: chartView, attribute: .bottom, relatedBy: .equal, toItem: curvesExplanation, attribute: .topMargin, multiplier: 1, constant: -20).isActive = true
            
            
            NSLayoutConstraint(item: curvesExplanation, attribute: .top, relatedBy: .equal, toItem: chartView, attribute: .bottomMargin, multiplier: 1, constant: -15).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.size.width).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 15).isActive = true
            NSLayoutConstraint(item: curvesExplanation, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
            curvesExplanationStackView.spacing = 7
            leftCEStackView.spacing = 7
            rightCEStackView.spacing = 7
            leftOfLeftStackView.spacing = 5
            rightOfLeftStackView.spacing = 5
            leftOfRightStackView.spacing = 5
            rightOfRightStackView.spacing = 5
            firstCEword.font = UIFont.systemFont(ofSize: 22)
            firstCEline.font = UIFont.systemFont(ofSize: 25)
            secondCEword.font = UIFont.systemFont(ofSize: 22)
            secondCEline.font = UIFont.systemFont(ofSize: 25)
            thirdCEword.font = UIFont.systemFont(ofSize: 22)
            thirdCEline.font = UIFont.systemFont(ofSize: 25)
            fourthCEword.font = UIFont.systemFont(ofSize: 22)
            fourthCEline.font = UIFont.systemFont(ofSize: 25)
            
            
            NSLayoutConstraint(item: userDetailsStackView, attribute: .top, relatedBy: .equal, toItem: curvesExplanation, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
            userDetailsStackView.spacing = 20
            NSLayoutConstraint(item: userDetailsStackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 240).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (UIScreen.main.bounds.size.width)-20).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: userDetailsStackView, attribute: .bottom, relatedBy: .equal, toItem: historyTableView, attribute: .topMargin, multiplier: 1, constant: -10).isActive = true
            NSLayoutConstraint(item: ovalBMI, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 160).isActive = true
            nameOfBlockGoal.font = UIFont.systemFont(ofSize: 22)
            nameOfBlockCurrentWeight.font = UIFont.systemFont(ofSize: 22)
            goalLabel.font = UIFont.systemFont(ofSize: 50)
            weightMetricLabel.font = UIFont.systemFont(ofSize: 22)
            currentWeightLabel.font = UIFont.systemFont(ofSize: 50)
            remainLabel.font = UIFont.systemFont(ofSize: 22)
            
            
            
            NSLayoutConstraint(item: historyTableView, attribute: .top, relatedBy: .equal, toItem: userDetailsStackView, attribute: .bottomMargin, multiplier: 1, constant: -15).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.size.width).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 40).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: historyTableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
            
            
            
        default:
            print("Unknown device")
        }
        
    }
}

extension AddTodaysWeightViewController {
    
    func constraintsSizerDependingOnDevice() {
        
        switch UIScreen.main.bounds.size.height {
            
        case 568:
        print("Start screen sizing AddVC for iPhone SE/5/5c")
            

        guard let whatsYourWeightLabel = whatsYourWeightLabel, let upperWeightView = upperWeightView, let addTodayButton = addTodaysWeightButton, let addSpecificDateWeightButton = addSpecificDateWeightButton, let useLowerLabel = useLowerLabel, let myWeightAtLabel = myWeightAtLabel, let datePicker = datePicker, let wasLabel = wasLabel, let lowerWeightView = lowerWeightView else {return}
        NSLayoutConstraint(item: whatsYourWeightLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 5).isActive = true
        whatsYourWeightLabel.font = UIFont.systemFont(ofSize: 20)
        NSLayoutConstraint(item: whatsYourWeightLabel, attribute: .bottom, relatedBy: .equal, toItem: upperWeightView, attribute: .topMargin, multiplier: 1, constant: -15).isActive = true
    
        
        NSLayoutConstraint(item: upperWeightView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true

        NSLayoutConstraint(item: upperWeightView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
        NSLayoutConstraint(item: upperWeightView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 76).isActive = true
        NSLayoutConstraint(item: upperWeightView, attribute: .bottom, relatedBy: .equal, toItem: addTodayButton, attribute: .topMargin, multiplier: 1, constant: -25).isActive = true
            
        NSLayoutConstraint(item: addTodayButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: addTodayButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
        NSLayoutConstraint(item: addTodayButton, attribute: .bottom, relatedBy: .equal, toItem: useLowerLabel, attribute: .topMargin, multiplier: 1, constant: -20).isActive = true
            
        useLowerLabel.font = UIFont.systemFont(ofSize: 20)
        NSLayoutConstraint(item: useLowerLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: useLowerLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: useLowerLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -15).isActive = true
        NSLayoutConstraint(item: useLowerLabel, attribute: .bottom, relatedBy: .equal, toItem: myWeightAtLabel, attribute: .top, multiplier: 1, constant: -15).isActive = true
            
            
        myWeightAtLabel.font = UIFont.systemFont(ofSize: 25)
        NSLayoutConstraint(item: myWeightAtLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: myWeightAtLabel, attribute: .bottom, relatedBy: .equal, toItem: datePicker, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: datePicker, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: datePicker, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
        NSLayoutConstraint(item: datePicker, attribute: .bottom, relatedBy: .equal, toItem: wasLabel, attribute: .top, multiplier: 1, constant: 0).isActive = true
        wasLabel.font = UIFont.systemFont(ofSize: 25)
        NSLayoutConstraint(item: wasLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: wasLabel, attribute: .bottom, relatedBy: .equal, toItem: lowerWeightView, attribute: .top, multiplier: 1, constant: -5).isActive = true
        
        NSLayoutConstraint(item: lowerWeightView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: lowerWeightView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
        NSLayoutConstraint(item: lowerWeightView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 76).isActive = true
        NSLayoutConstraint(item: addSpecificDateWeightButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: addSpecificDateWeightButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
        NSLayoutConstraint(item: lowerWeightView, attribute: .bottom, relatedBy: .equal, toItem: addSpecificDateWeightButton, attribute: .topMargin, multiplier: 1, constant: -25).isActive = true
            
        case 667:
            print("Start screen sizing AddVC for iPhone 8/7/6s/6")
            
            guard let whatsYourWeightLabel = whatsYourWeightLabel, let upperWeightView = upperWeightView, let addTodayButton = addTodaysWeightButton, let addSpecificDateWeightButton = addSpecificDateWeightButton, let useLowerLabel = useLowerLabel, let myWeightAtLabel = myWeightAtLabel, let datePicker = datePicker, let wasLabel = wasLabel, let lowerWeightView = lowerWeightView else {return}
            
                NSLayoutConstraint(item: whatsYourWeightLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 10).isActive = true
                whatsYourWeightLabel.font = UIFont.systemFont(ofSize: 28)
                NSLayoutConstraint(item: whatsYourWeightLabel, attribute: .bottom, relatedBy: .equal, toItem: upperWeightView, attribute: .topMargin, multiplier: 1, constant: -20).isActive = true
            
                
                NSLayoutConstraint(item: upperWeightView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true

                NSLayoutConstraint(item: upperWeightView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
                NSLayoutConstraint(item: upperWeightView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 76).isActive = true
                NSLayoutConstraint(item: upperWeightView, attribute: .bottom, relatedBy: .equal, toItem: addTodayButton, attribute: .topMargin, multiplier: 1, constant: -35).isActive = true
                    
                NSLayoutConstraint(item: addTodayButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: addTodayButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
                NSLayoutConstraint(item: addTodayButton, attribute: .bottom, relatedBy: .equal, toItem: useLowerLabel, attribute: .topMargin, multiplier: 1, constant: -25).isActive = true
                    
                useLowerLabel.font = UIFont.systemFont(ofSize: 25)
                NSLayoutConstraint(item: useLowerLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: useLowerLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 10).isActive = true
                NSLayoutConstraint(item: useLowerLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -15).isActive = true
                NSLayoutConstraint(item: useLowerLabel, attribute: .bottom, relatedBy: .equal, toItem: myWeightAtLabel, attribute: .top, multiplier: 1, constant: -25).isActive = true
                    
                    
                myWeightAtLabel.font = UIFont.systemFont(ofSize: 28)
                NSLayoutConstraint(item: myWeightAtLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: myWeightAtLabel, attribute: .bottom, relatedBy: .equal, toItem: datePicker, attribute: .top, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: datePicker, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: datePicker, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
                NSLayoutConstraint(item: datePicker, attribute: .bottom, relatedBy: .equal, toItem: wasLabel, attribute: .top, multiplier: 1, constant: 0).isActive = true
                wasLabel.font = UIFont.systemFont(ofSize: 28)
                NSLayoutConstraint(item: wasLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: wasLabel, attribute: .bottom, relatedBy: .equal, toItem: lowerWeightView, attribute: .top, multiplier: 1, constant: -20).isActive = true
                
                NSLayoutConstraint(item: lowerWeightView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: lowerWeightView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
                NSLayoutConstraint(item: lowerWeightView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 76).isActive = true
                NSLayoutConstraint(item: addSpecificDateWeightButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: addSpecificDateWeightButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
                NSLayoutConstraint(item: lowerWeightView, attribute: .bottom, relatedBy: .equal, toItem: addSpecificDateWeightButton, attribute: .topMargin, multiplier: 1, constant: -35).isActive = true
            
            case 736:
            print("Start screen sizing for iPhone 8+, 7+, 6s+, 6+")
            
            guard let whatsYourWeightLabel = whatsYourWeightLabel, let upperWeightView = upperWeightView, let addTodayButton = addTodaysWeightButton, let addSpecificDateWeightButton = addSpecificDateWeightButton, let useLowerLabel = useLowerLabel, let myWeightAtLabel = myWeightAtLabel, let datePicker = datePicker, let wasLabel = wasLabel, let lowerWeightView = lowerWeightView else {return}
            
                NSLayoutConstraint(item: whatsYourWeightLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 20).isActive = true
                whatsYourWeightLabel.font = UIFont.systemFont(ofSize: 28)
                NSLayoutConstraint(item: whatsYourWeightLabel, attribute: .bottom, relatedBy: .equal, toItem: upperWeightView, attribute: .topMargin, multiplier: 1, constant: -20).isActive = true
            
                
                NSLayoutConstraint(item: upperWeightView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true

                NSLayoutConstraint(item: upperWeightView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
                NSLayoutConstraint(item: upperWeightView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 76).isActive = true
                NSLayoutConstraint(item: upperWeightView, attribute: .bottom, relatedBy: .equal, toItem: addTodayButton, attribute: .topMargin, multiplier: 1, constant: -35).isActive = true
                    
                NSLayoutConstraint(item: addTodayButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: addTodayButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
                NSLayoutConstraint(item: addTodayButton, attribute: .bottom, relatedBy: .equal, toItem: useLowerLabel, attribute: .topMargin, multiplier: 1, constant: -45).isActive = true
                    
                useLowerLabel.font = UIFont.systemFont(ofSize: 25)
                NSLayoutConstraint(item: useLowerLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: useLowerLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 10).isActive = true
                NSLayoutConstraint(item: useLowerLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -15).isActive = true
                NSLayoutConstraint(item: useLowerLabel, attribute: .bottom, relatedBy: .equal, toItem: myWeightAtLabel, attribute: .top, multiplier: 1, constant: -25).isActive = true
                    
                    
                myWeightAtLabel.font = UIFont.systemFont(ofSize: 28)
                NSLayoutConstraint(item: myWeightAtLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: myWeightAtLabel, attribute: .bottom, relatedBy: .equal, toItem: datePicker, attribute: .top, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: datePicker, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: datePicker, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
                NSLayoutConstraint(item: datePicker, attribute: .bottom, relatedBy: .equal, toItem: wasLabel, attribute: .top, multiplier: 1, constant: 0).isActive = true
                wasLabel.font = UIFont.systemFont(ofSize: 28)
                NSLayoutConstraint(item: wasLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: wasLabel, attribute: .bottom, relatedBy: .equal, toItem: lowerWeightView, attribute: .top, multiplier: 1, constant: -20).isActive = true
                
                NSLayoutConstraint(item: lowerWeightView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: lowerWeightView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
                NSLayoutConstraint(item: lowerWeightView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 76).isActive = true
                NSLayoutConstraint(item: addSpecificDateWeightButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: addSpecificDateWeightButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
                NSLayoutConstraint(item: lowerWeightView, attribute: .bottom, relatedBy: .equal, toItem: addSpecificDateWeightButton, attribute: .topMargin, multiplier: 1, constant: -35).isActive = true
            
            case 812:
            print("Start screen sizing for iPhone 11 Pro/X/Xs")
            
            guard let whatsYourWeightLabel = whatsYourWeightLabel, let upperWeightView = upperWeightView, let addTodayButton = addTodaysWeightButton, let addSpecificDateWeightButton = addSpecificDateWeightButton, let useLowerLabel = useLowerLabel, let myWeightAtLabel = myWeightAtLabel, let datePicker = datePicker, let wasLabel = wasLabel, let lowerWeightView = lowerWeightView else {return}
            
                NSLayoutConstraint(item: whatsYourWeightLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 35).isActive = true
                whatsYourWeightLabel.font = UIFont.systemFont(ofSize: 28)
                NSLayoutConstraint(item: whatsYourWeightLabel, attribute: .bottom, relatedBy: .equal, toItem: upperWeightView, attribute: .topMargin, multiplier: 1, constant: -20).isActive = true
            
                
                NSLayoutConstraint(item: upperWeightView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true

                NSLayoutConstraint(item: upperWeightView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
                NSLayoutConstraint(item: upperWeightView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 76).isActive = true
                NSLayoutConstraint(item: upperWeightView, attribute: .bottom, relatedBy: .equal, toItem: addTodayButton, attribute: .topMargin, multiplier: 1, constant: -35).isActive = true
                    
                NSLayoutConstraint(item: addTodayButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: addTodayButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
                NSLayoutConstraint(item: addTodayButton, attribute: .bottom, relatedBy: .equal, toItem: useLowerLabel, attribute: .topMargin, multiplier: 1, constant: -45).isActive = true
                    
                useLowerLabel.font = UIFont.systemFont(ofSize: 25)
                NSLayoutConstraint(item: useLowerLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: useLowerLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 10).isActive = true
                NSLayoutConstraint(item: useLowerLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -15).isActive = true
                NSLayoutConstraint(item: useLowerLabel, attribute: .bottom, relatedBy: .equal, toItem: myWeightAtLabel, attribute: .top, multiplier: 1, constant: -25).isActive = true
                    
                    
                myWeightAtLabel.font = UIFont.systemFont(ofSize: 28)
                NSLayoutConstraint(item: myWeightAtLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: myWeightAtLabel, attribute: .bottom, relatedBy: .equal, toItem: datePicker, attribute: .top, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: datePicker, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: datePicker, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
                NSLayoutConstraint(item: datePicker, attribute: .bottom, relatedBy: .equal, toItem: wasLabel, attribute: .top, multiplier: 1, constant: 0).isActive = true
                wasLabel.font = UIFont.systemFont(ofSize: 28)
                NSLayoutConstraint(item: wasLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: wasLabel, attribute: .bottom, relatedBy: .equal, toItem: lowerWeightView, attribute: .top, multiplier: 1, constant: -20).isActive = true
                
                NSLayoutConstraint(item: lowerWeightView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: lowerWeightView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
                NSLayoutConstraint(item: lowerWeightView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 76).isActive = true
                NSLayoutConstraint(item: addSpecificDateWeightButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                NSLayoutConstraint(item: addSpecificDateWeightButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
                NSLayoutConstraint(item: lowerWeightView, attribute: .bottom, relatedBy: .equal, toItem: addSpecificDateWeightButton, attribute: .topMargin, multiplier: 1, constant: -35).isActive = true
            
            case 896:
            print("Start screen sizing for iPhone 11 Pro Max/Xs Max/11/Xr")
            
            guard let whatsYourWeightLabel = whatsYourWeightLabel, let upperWeightView = upperWeightView, let addTodayButton = addTodaysWeightButton, let addSpecificDateWeightButton = addSpecificDateWeightButton, let useLowerLabel = useLowerLabel, let myWeightAtLabel = myWeightAtLabel, let datePicker = datePicker, let wasLabel = wasLabel, let lowerWeightView = lowerWeightView else {return}
              
                  NSLayoutConstraint(item: whatsYourWeightLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 45).isActive = true
                  whatsYourWeightLabel.font = UIFont.systemFont(ofSize: 32)
                  NSLayoutConstraint(item: whatsYourWeightLabel, attribute: .bottom, relatedBy: .equal, toItem: upperWeightView, attribute: .topMargin, multiplier: 1, constant: -20).isActive = true
              
                  
                  NSLayoutConstraint(item: upperWeightView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true

                  NSLayoutConstraint(item: upperWeightView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
                  NSLayoutConstraint(item: upperWeightView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 76).isActive = true
                  NSLayoutConstraint(item: upperWeightView, attribute: .bottom, relatedBy: .equal, toItem: addTodayButton, attribute: .topMargin, multiplier: 1, constant: -35).isActive = true
                      
                  NSLayoutConstraint(item: addTodayButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                  NSLayoutConstraint(item: addTodayButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
                  NSLayoutConstraint(item: addTodayButton, attribute: .bottom, relatedBy: .equal, toItem: useLowerLabel, attribute: .topMargin, multiplier: 1, constant: -45).isActive = true
                      
                  useLowerLabel.font = UIFont.systemFont(ofSize: 25)
                  NSLayoutConstraint(item: useLowerLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                  NSLayoutConstraint(item: useLowerLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 10).isActive = true
                  NSLayoutConstraint(item: useLowerLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -15).isActive = true
                  NSLayoutConstraint(item: useLowerLabel, attribute: .bottom, relatedBy: .equal, toItem: myWeightAtLabel, attribute: .top, multiplier: 1, constant: -25).isActive = true
                      
                      
                  myWeightAtLabel.font = UIFont.systemFont(ofSize: 32)
                  NSLayoutConstraint(item: myWeightAtLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                  NSLayoutConstraint(item: myWeightAtLabel, attribute: .bottom, relatedBy: .equal, toItem: datePicker, attribute: .top, multiplier: 1, constant: 0).isActive = true
                  NSLayoutConstraint(item: datePicker, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                  NSLayoutConstraint(item: datePicker, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
                  NSLayoutConstraint(item: datePicker, attribute: .bottom, relatedBy: .equal, toItem: wasLabel, attribute: .top, multiplier: 1, constant: 0).isActive = true
                  wasLabel.font = UIFont.systemFont(ofSize: 32)
                  NSLayoutConstraint(item: wasLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                  NSLayoutConstraint(item: wasLabel, attribute: .bottom, relatedBy: .equal, toItem: lowerWeightView, attribute: .top, multiplier: 1, constant: -20).isActive = true
                  
                  NSLayoutConstraint(item: lowerWeightView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                  NSLayoutConstraint(item: lowerWeightView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
                  NSLayoutConstraint(item: lowerWeightView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 76).isActive = true
                  NSLayoutConstraint(item: addSpecificDateWeightButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
                  NSLayoutConstraint(item: addSpecificDateWeightButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
                  NSLayoutConstraint(item: lowerWeightView, attribute: .bottom, relatedBy: .equal, toItem: addSpecificDateWeightButton, attribute: .topMargin, multiplier: 1, constant: -35).isActive = true
            
            
        default:
            print("Unknown device")
        }
    }
}
