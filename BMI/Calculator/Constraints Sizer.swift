//
//  Screen Sizer.swift
//  BMI
//
//  Created by Alexey Mefodyev on 02.02.2020.
//  Copyright © 2020 Super Developers. All rights reserved.
//
import UIKit

extension CalculatorViewController {

    func constraintsSizerDependingOnDevice() {

        switch UIScreen.main.bounds.size.height {
        //iPhone SE, 5, 5c
        case 568:
            print("Start screen sizing for iPhone SE/5/5c")

            //bmiCalculatorLabel constraints
            guard let bmiCalculatorLabel = bmiCalculatorLabel else { return }
            bmiCalculatorLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 289).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 25).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .top, relatedBy: .equal, toItem: topLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .leadingMargin, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .trailingMargin, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 5).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .bottomMargin, relatedBy: .equal, toItem: genderStackView, attribute: .topMargin, multiplier: 1, constant: 1).isActive = true

            //Gender buttons content settings
            guard let genderStackView = genderStackView, let femaleButtonContainer = femaleButtonContainer, let maleButtonContainer = maleButtonContainer, let maleButton = maleButton, let femaleButton = femaleButton else { return }
            genderStackView.translatesAutoresizingMaskIntoConstraints = false
            femaleButtonContainer.translatesAutoresizingMaskIntoConstraints = false
            maleButtonContainer.translatesAutoresizingMaskIntoConstraints = false
            maleButton.translatesAutoresizingMaskIntoConstraints = false
            femaleButton.translatesAutoresizingMaskIntoConstraints = false
            genderStackView.spacing = 12

            ///genderStackView
            NSLayoutConstraint(item: genderStackView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerXWithinMargins, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: genderStackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 269).isActive = true
            NSLayoutConstraint(item: genderStackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 124.5).isActive = true
            NSLayoutConstraint(item: genderStackView, attribute: .topMargin, relatedBy: .equal, toItem: bmiCalculatorLabel, attribute: .bottomMargin, multiplier: 1, constant: 1).isActive = true
            NSLayoutConstraint(item: genderStackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: genderStackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 30).isActive = true

            NSLayoutConstraint(item: genderStackView, attribute: .bottomMargin, relatedBy: .equal, toItem: dataFieldSuperStackView, attribute: .top, multiplier: 1, constant: 10).isActive = true

            //dataFieldSuperStackView constraints
            guard let dataFieldSuperStackView = dataFieldSuperStackView,let heightTextField = heightTextField else {return}
            measuresStackView.spacing = 4
            textViewsStackView.spacing = 4
            dataFieldSuperStackView.spacing = 8

            NSLayoutConstraint(item: heightTextField, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 164.5).isActive = true

            dataFieldSuperStackView.translatesAutoresizingMaskIntoConstraints = false
            measuresStackView.translatesAutoresizingMaskIntoConstraints = false
            textViewsStackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 289).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 319).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .top, relatedBy: .equal, toItem: genderStackView, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 15).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 20).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .bottomMargin, relatedBy: .equal, toItem: saveButton, attribute: .top, multiplier: 1, constant: 10).isActive = true

            //            saveButton constraints
            guard let saveButton = saveButton else {return}
            saveButton.translatesAutoresizingMaskIntoConstraints = false
            saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 22.5)
            NSLayoutConstraint(item: saveButton, attribute: .top, relatedBy: .equal, toItem: dataFieldSuperStackView, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
            NSLayoutConstraint(item: saveButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 269).isActive = true
            NSLayoutConstraint(item: saveButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60).isActive = true
            NSLayoutConstraint(item: saveButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: saveButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: saveButton, attribute: .bottom, relatedBy: .equal, toItem: bottomLayoutGuide, attribute: .bottom, multiplier: 1, constant: 5).isActive = true


        //iPhone 8, 7, 6s, 6
        case 667:
            print("Start screen sizing for iPhone 8/7/6s/6")

            //bmiCalculatorLabel constraints
            guard let bmiCalculatorLabel = bmiCalculatorLabel else { return }
            bmiCalculatorLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 335).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .leadingMargin, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .trailingMargin, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 5).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .bottomMargin, relatedBy: .equal, toItem: genderStackView, attribute: .topMargin, multiplier: 1, constant: 5).isActive = true

            //Gender buttons content settings
            guard let genderStackView = genderStackView, let femaleButtonContainer = femaleButtonContainer, let maleButtonContainer = maleButtonContainer, let maleButton = maleButton, let femaleButton = femaleButton else { return }
            genderStackView.translatesAutoresizingMaskIntoConstraints = false
            femaleButtonContainer.translatesAutoresizingMaskIntoConstraints = false
            maleButtonContainer.translatesAutoresizingMaskIntoConstraints = false
            maleButton.translatesAutoresizingMaskIntoConstraints = false
            femaleButton.translatesAutoresizingMaskIntoConstraints = false
            genderStackView.spacing = 15

            ///genderStackView
            NSLayoutConstraint(item: genderStackView, attribute: .topMargin, relatedBy: .equal, toItem: bmiCalculatorLabel, attribute: .bottomMargin, multiplier: 1, constant: 5).isActive = true
            NSLayoutConstraint(item: genderStackView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerXWithinMargins, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: genderStackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 315).isActive = true
            NSLayoutConstraint(item: genderStackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 147.5).isActive = true
            NSLayoutConstraint(item: genderStackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: genderStackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 30).isActive = true

            NSLayoutConstraint(item: genderStackView, attribute: .bottomMargin, relatedBy: .equal, toItem: dataFieldSuperStackView, attribute: .top, multiplier: 1, constant: 15).isActive = true


            //dataFieldSuperStackView constraints
            guard let dataFieldSuperStackView = dataFieldSuperStackView else {return}
            dataFieldSuperStackView.spacing = 30
            measuresStackView.spacing = 23
            textViewsStackView.spacing = 23
            dataFieldSuperStackView.translatesAutoresizingMaskIntoConstraints = false
            measuresStackView.translatesAutoresizingMaskIntoConstraints = false
            textViewsStackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 335).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 370).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .top, relatedBy: .equal, toItem: genderStackView, attribute: .bottom, multiplier: 1, constant: 15).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 20).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 20).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .bottomMargin, relatedBy: .equal, toItem: saveButton, attribute: .topMargin, multiplier: 1, constant: 20).isActive = true


//            NSLayoutConstraint(item: heightTextField, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 197.5).isActive = true
//            NSLayoutConstraint(item: weightView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 241.5).isActive = true
//            NSLayoutConstraint(item: weightSCview, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 88.5).isActive = true
//            NSLayoutConstraint(item: weightMinusButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 38).isActive = true
//            NSLayoutConstraint(item: weightMinusButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 38).isActive = true


            //            saveButton constraints
            guard let saveButton = saveButton else {return}
            saveButton.translatesAutoresizingMaskIntoConstraints = false
            saveButton.titleLabel?.adjustsFontSizeToFitWidth = true
            NSLayoutConstraint(item: saveButton, attribute: .topMargin, relatedBy: .equal, toItem: dataFieldSuperStackView, attribute: .bottomMargin, multiplier: 1, constant: 20).isActive = true
            NSLayoutConstraint(item: saveButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 335).isActive = true
            NSLayoutConstraint(item: saveButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60).isActive = true
            NSLayoutConstraint(item: saveButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: saveButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: saveButton, attribute: .bottomMargin, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: 15).isActive = true




        case 736:
            print("Start screen sizing for iPhone 8+, 7+, 6s+, 6+")
            //bmiCalculatorLabel constraints
            guard let bmiCalculatorLabel = bmiCalculatorLabel else { return }
            bmiCalculatorLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 335).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .leadingMargin, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .trailingMargin, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 5).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .bottomMargin, relatedBy: .equal, toItem: genderStackView, attribute: .topMargin, multiplier: 1, constant: 10).isActive = true
            
            //Gender buttons content settings
            guard let genderStackView = genderStackView, let femaleButtonContainer = femaleButtonContainer, let maleButtonContainer = maleButtonContainer, let maleButton = maleButton, let femaleButton = femaleButton else { return }
            genderStackView.translatesAutoresizingMaskIntoConstraints = false
            femaleButtonContainer.translatesAutoresizingMaskIntoConstraints = false
            maleButtonContainer.translatesAutoresizingMaskIntoConstraints = false
            maleButton.translatesAutoresizingMaskIntoConstraints = false
            femaleButton.translatesAutoresizingMaskIntoConstraints = false
            genderStackView.spacing = 33
            
            ///genderStackView
            NSLayoutConstraint(item: genderStackView, attribute: .topMargin, relatedBy: .equal, toItem: bmiCalculatorLabel, attribute: .bottomMargin, multiplier: 1, constant: 5).isActive = true
            NSLayoutConstraint(item: genderStackView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerXWithinMargins, multiplier: 1, constant: 0).isActive = true
            //                        NSLayoutConstraint(item: genderStackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 315).isActive = true
            NSLayoutConstraint(item: genderStackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 160).isActive = true
            NSLayoutConstraint(item: genderStackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 70).isActive = true
            NSLayoutConstraint(item: genderStackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 70).isActive = true
            NSLayoutConstraint(item: femaleButtonContainer, attribute: .width, relatedBy: .equal, toItem: femaleButtonContainer, attribute: .height, multiplier: 1.0/1.0, constant: 0).isActive = true
            
            NSLayoutConstraint(item: genderStackView, attribute: .bottomMargin, relatedBy: .equal, toItem: dataFieldSuperStackView, attribute: .top, multiplier: 1, constant: 15).isActive = true
            
            
            //dataFieldSuperStackView constraints
            guard let dataFieldSuperStackView = dataFieldSuperStackView else {return}
            measuresStackView.spacing = 35
            textViewsStackView.spacing = 35
            dataFieldSuperStackView.spacing = 40

            dataFieldSuperStackView.translatesAutoresizingMaskIntoConstraints = false
            measuresStackView.translatesAutoresizingMaskIntoConstraints = false
            textViewsStackView.translatesAutoresizingMaskIntoConstraints = false

            //                        NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 415).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .top, relatedBy: .equal, toItem: genderStackView, attribute: .bottom, multiplier: 1, constant: 15).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 10).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .bottomMargin, relatedBy: .equal, toItem: saveButton, attribute: .topMargin, multiplier: 1, constant: 20).isActive = true
            
            
            //            NSLayoutConstraint(item: weightMinusButton, attribute: .width, relatedBy: .equal, toItem: weightPlusButton, attribute: .height, multiplier: 1.0/1.0, constant: 0).isActive = true
            //            NSLayoutConstraint(item: weightView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 241.5).isActive = true
            //            NSLayoutConstraint(item: weightSCview, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 88.5).isActive = true
            //                        NSLayoutConstraint(item: weightMinusButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 38).isActive = true
            //                        NSLayoutConstraint(item: weightMinusButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 38).isActive = true
            //            NSLayoutConstraint(item: weightPlusButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 38).isActive = true
            //            NSLayoutConstraint(item: weightPlusButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 38).isActive = true
            
            
            //            saveButton constraints
            guard let saveButton = saveButton else {return}
            saveButton.translatesAutoresizingMaskIntoConstraints = false
            saveButton.titleLabel?.adjustsFontSizeToFitWidth = true
            NSLayoutConstraint(item: saveButton, attribute: .topMargin, relatedBy: .equal, toItem: dataFieldSuperStackView, attribute: .bottomMargin, multiplier: 1, constant: 20).isActive = true
            NSLayoutConstraint(item: saveButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 335).isActive = true
            NSLayoutConstraint(item: saveButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60).isActive = true
            NSLayoutConstraint(item: saveButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: saveButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: saveButton, attribute: .bottomMargin, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: 15).isActive = true

        case 812:
            print("11 Pro, X, Xs")

            //bmiCalculatorLabel constraints
            guard let bmiCalculatorLabel = bmiCalculatorLabel else { return }
            bmiCalculatorLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 20).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 354).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .leadingMargin, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .trailingMargin, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .bottomMargin, relatedBy: .equal, toItem: genderStackView, attribute: .topMargin, multiplier: 1, constant: 30).isActive = true

            //gender stack view
            guard let genderStackView = genderStackView else { return }
            NSLayoutConstraint(item: genderStackView, attribute: .bottomMargin, relatedBy: .equal, toItem: dataFieldSuperStackView, attribute: .top, multiplier: 1, constant: 30).isActive = true

            //dataFieldSuperStackView constraints
            guard let dataFieldSuperStackView = dataFieldSuperStackView, let saveButton = saveButton else {return}
            dataFieldSuperStackView.spacing = 35
            measuresStackView.spacing = 35
            textViewsStackView.spacing = 35

            dataFieldSuperStackView.translatesAutoresizingMaskIntoConstraints = false
       

//            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300).isActive = true
//            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 440).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .top, relatedBy: .equal, toItem: genderStackView, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 20).isActive = true
//            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 10).isActive = true
//            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .bottomMargin, relatedBy: .equal, toItem: saveButton, attribute: .topMargin, multiplier: 1, constant: 30).isActive = true

            NSLayoutConstraint(item: saveButton, attribute: .topMargin, relatedBy: .equal, toItem: dataFieldSuperStackView, attribute: .bottomMargin, multiplier: 1, constant: 30).isActive = true

        case 896:
            print("11 Pro Max/Xs Max/11/Xr")

            //bmiCalculatorLabel constraints
            guard let bmiCalculatorLabel = bmiCalculatorLabel else { return }
            bmiCalculatorLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 20).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 354).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .leadingMargin, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .trailingMargin, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 30).isActive = true
            NSLayoutConstraint(item: bmiCalculatorLabel, attribute: .bottomMargin, relatedBy: .equal, toItem: genderStackView, attribute: .topMargin, multiplier: 1, constant: 30).isActive = true
            
            //gender stack view
            guard let genderStackView = genderStackView else { return }
            NSLayoutConstraint(item: genderStackView, attribute: .bottomMargin, relatedBy: .equal, toItem: dataFieldSuperStackView, attribute: .top, multiplier: 1, constant: 30).isActive = true
            
            //dataFieldSuperStackView constraints
            guard let dataFieldSuperStackView = dataFieldSuperStackView else {return}
            dataFieldSuperStackView.spacing = 30
            measuresStackView.spacing = 56
            textViewsStackView.spacing = 56
            
            dataFieldSuperStackView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320).isActive = true

            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 420).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .top, relatedBy: .equal, toItem: genderStackView, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 40).isActive = true
            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 10).isActive = true
            //            NSLayoutConstraint(item: dataFieldSuperStackView, attribute: .bottomMargin, relatedBy: .equal, toItem: saveButton, attribute: .topMargin, multiplier: 1, constant: 30).isActive = true
            guard let saveButton = saveButton else {return}
            NSLayoutConstraint(item: saveButton, attribute: .topMargin, relatedBy: .equal, toItem: dataFieldSuperStackView, attribute: .bottomMargin, multiplier: 1, constant: 30).isActive = true


        default:
            print("Unknown device")
        }
    }
}

