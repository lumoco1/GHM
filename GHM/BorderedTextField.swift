//
//  BorderedTextField.swift
//  GHM
//
//  Created by Luis Morales on 17/4/17.
//  Copyright © 2017 Luis Morales. All rights reserved.
//

import Foundation
import UIKit

class BorderedTextField: UITextField {
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(origin: CGPoint.zero, size: self.frame.size)
        gradient.colors = [UIColor(red: 51 / 255.0, green: 51 / 255.0, blue: 255 / 255, alpha: 1.0).cgColor,UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 102 / 255, alpha: 1.0).cgColor]
        gradient.cornerRadius = 4
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)

        
        let shape = CAShapeLayer()
        shape.lineWidth = 4
        shape.path = UIBezierPath(rect: self.bounds).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        self.layer.addSublayer(gradient)
    }
    
    
}
