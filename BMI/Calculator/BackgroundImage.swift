//
//  BackgroundImage.swift
//  BMI
//
//  Created by Alexey Mefodyev on 29/08/2019.
//  Copyright © 2019 Super Developers. All rights reserved.
//

import Foundation
import UIKit


//This extension is made for correct display of backgroung Image in our App
extension UIView {
    
    func addBackground() {
           // screen width and height:
           let width = UIScreen.main.bounds.size.width
           let height = UIScreen.main.bounds.size.height
           
           let imageViewBackground = UIImageView (frame: CGRect(x: 0, y: 0, width: width, height: height))
           imageViewBackground.image = UIImage(named: "bg.png")
           
           // change the content mode:
           imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
           
           self.addSubview(imageViewBackground)
           self.sendSubviewToBack(imageViewBackground)
       }
   }


