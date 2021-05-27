//
//  UITabBar Extension.swift
//  Mint Task
//
//  Created by Anas J on 5/27/21.
//

import Foundation
import UIKit

class TabBarWithCurve: UITabBar {
    private var mainColor = UIColor(red: 44/255, green: 44/255, blue: 44/255, alpha: 1)
    private var shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.61)
    private var shapeLayer: CALayer?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Change UITabBar height and location acorrding to the existence of bottom notch
        let bottomArea = UIApplication.shared.windows[0].safeAreaInsets.bottom
        self.isTranslucent = true
        var tabFrame = self.frame
        tabFrame.size.height = 69 + bottomArea
        tabFrame.origin.y = self.frame.origin.y + (bottomArea == 0 ? (tabFrame.size.height - 75.5 ) : 0)
        self.frame = tabFrame
        
        self.items?.forEach{$0.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)}
    }

    // Draw UITabBar using Bezier Path
    override func draw(_ rect: CGRect) {
        addShape()
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.fillColor = mainColor.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.shadowColor = shadowColor.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0 , height: -5)
        shapeLayer.shadowOpacity = 0.2
        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    private func createPath() -> CGPath {
        let height: CGFloat = 37.0
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        path.move(to: CGPoint(x: 0, y: 0)) // start top left
        path.addLine(to: CGPoint(x: (centerWidth - height * 2), y: 0))
        path.addCurve(to: CGPoint(x: centerWidth, y: height),
                      controlPoint1: CGPoint(x: (centerWidth - 30), y: 0), controlPoint2: CGPoint(x: centerWidth - 35, y: height))
        path.addCurve(to: CGPoint(x: (centerWidth + height * 2), y: 0),
                      controlPoint1: CGPoint(x: centerWidth + 35, y: height), controlPoint2: CGPoint(x: (centerWidth + 30), y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        
        return path.cgPath
    }
    
    // Make sure that UITabBar recieves action from outside its frame
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
        for member in subviews.reversed() {
            let subPoint = member.convert(point, from: self)
            guard let result = member.hitTest(subPoint, with: event) else { continue }
            return result
        }
        return nil
    }
}
