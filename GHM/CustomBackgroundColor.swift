//
//  CustomBackgroundColor.swift
//  GHM
//
//  Created by Luis Morales on 20/5/17.
//  Copyright © 2017 Luis Morales. All rights reserved.
//

import Foundation
import UIKit

class CustomBackgroundColor: UIView {
    
    let gradient: CAGradientLayer = CAGradientLayer()

    
    override func layoutSubviews() {
    
        super.layoutSubviews()
        
        gradient.colors = [UIColor(red: 255 / 255.0, green: 211 / 255.0, blue: 3 / 255, alpha: 1.0).cgColor,UIColor(red: 255 / 255.0, green: 163 / 255.0, blue: 32 / 255, alpha: 1.0).cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        
        self.layer.insertSublayer(gradient, at: 0)
        
    }
}
