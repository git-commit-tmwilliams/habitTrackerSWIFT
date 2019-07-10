//
//  PushButton.swift
//  Bee Habit Tracker
//
//  Created by Marleigh Williams on 10/17/17.
//  Copyright © 2017 Marleigh Williams. All rights reserved.
// Important: UIButton is a subclass of UIView, so all methods in UIView such as draw(_:), are also available in UIButton
// Within the Identity Inspector we can set our UIButton to a specical class/custom class

import UIKit

// Live Rendering --- allows views to draw themselves more accurately in storyboard \
// The storyboard will immediately update to changes in draw(_:)
@IBDesignable

class PushButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {

    }
    */
    @IBInspectable var fillColor: UIColor = UIColor.yellow
    @IBInspectable var isAddButton: Bool = true
    
    private struct Constants {
        static let plusLineWidth: CGFloat = 3.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        // bounds for height and width
        // for the horizontal line
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        // UIBezierPath (if unsure look up on apple.developer)
        let plusPath = UIBezierPath()
        
        // line width to height of horizontal line
        plusPath.lineWidth = Constants.plusLineWidth
        

        plusPath.move(to: CGPoint(
            x: halfWidth - halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift))
        
        
        // add to line
        plusPath.addLine(to: CGPoint(
            x: halfWidth + halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift))
        
        // vertical Line
        if isAddButton{
        plusPath.move(to: CGPoint(
            x: halfWidth + Constants.halfPointShift,
            y: halfHeight - halfPlusWidth + Constants.halfPointShift))
        
        plusPath.addLine(to: CGPoint(
            x: halfWidth + Constants.halfPointShift,
            y: halfHeight + halfPlusWidth + Constants.halfPointShift))
        }
        // setting the color with UIColor
        UIColor.white.setStroke()
        
        plusPath.stroke()
    }

}
