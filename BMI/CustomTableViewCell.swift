//
//  CustomTableViewCell.swift
//  BMI
//
//  Created by Alexey Mefodyev on 20.11.2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var observedWeightLabel: UILabel!
    @IBOutlet weak var selectedWeightMetric: UILabel!
    @IBOutlet weak var weightArrowImage: UIImageView!
    @IBOutlet weak var weightDifferenceLabel: UILabel!
    
}
