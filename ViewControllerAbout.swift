//
//  ViewController.swift
//  Bee Habit Tracker
//
//  Created by Marleigh Williams on 10/5/17.
//  Copyright © 2017 Marleigh Williams. All rights reserved.
//

import UIKit

class ViewControllerAbout: UIViewController {

    
    func animateBee(){
        let path = UIBezierPath()
        
        let imageBeeName = "bee"
        let imageBee = UIImage(named: imageBeeName)
        let imageView = UIImageView(image: imageBee)
        
        imageView.frame = CGRect(x: 55, y: 300, width: 87, height: 87)
        self.view.addSubview(imageView)
        
        path.move(to: CGPoint(x: 16, y: 239))
        path.addCurve(to: CGPoint(x: 310, y:400), controlPoint1: CGPoint(x:136, y: 373), controlPoint2: CGPoint(x:178, y: 110))
        
        // create a new CAKeyframeAnimation that animates the objects position
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        animation.path = path.cgPath
        
        // set some more parameters for the animation
        // this rotation mode means that our object will rotate so that it's parallel to whatever point it is currently on the curve
        animation.rotationMode = kCAAnimationRotateAuto
        animation.repeatCount = Float.infinity
        animation.duration = 5.0
        
        imageView.layer.add(animation, forKey: "animate position along path")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.animateBee()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
