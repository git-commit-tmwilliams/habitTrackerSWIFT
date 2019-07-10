//
//  BeeMovement.swift
//  Bee Habit Tracker
//
//  Created by Marleigh Williams on 12/4/17.
//  Copyright © 2017 Marleigh Williams. All rights reserved.
//

import UIKit

class BeeMovement: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func draw(_ rect: CGRect) {
        
        let bee = UIImageView()
        bee.image = UIImage(named: "bee.png")
        bee.frame = CGRect(x: 50, y:50, width: 50, height: 50)
        //self.view.addSubview(bee)
        
        let path = UIBezierPath()
        
        path.move(to: (CGPoint(x: 16, y: 239)))
        
        path.addCurve(to: CGPoint(x: 301, y: 239), controlPoint1: CGPoint(x: 136, y: 373), controlPoint2: CGPoint(x: 178, y: 110))
        
        // create a new CAKeyframeAnimation that animates the objects position
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        
        // set the animations path to our bezier curve
        animation.path = path.cgPath
        
        // set some more parameters for the animation
        // this rotation mode means that our object will rotate so that it's parallel to whatever point it is currently on the curve
        animation.rotationMode = kCAAnimationRotateAuto
        animation.repeatCount = Float.infinity
        animation.duration = 5.0
        
        
    }

    
    
}
