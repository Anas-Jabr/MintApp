//
//  UIViewController Extension.swift
//  Mint Task
//
//  Created by Anas J on 5/27/21.
//

import Foundation
import UIKit

extension UIViewController{
    func setGradientBackground() {
        let topColor =  UIColor(hexString: "#000000").cgColor
        let bottomColor = UIColor(hexString: "#323232").cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor, bottomColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}
