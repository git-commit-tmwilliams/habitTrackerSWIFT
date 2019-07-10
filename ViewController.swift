//
//  ViewController.swift
//  Bee Habit Tracker
//
//  Created by Marleigh Williams on 10/5/17.
//  Copyright © 2017 Marleigh Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Counter outlets
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    
    @IBAction func pushButtonPressed(_ button: PushButton) {
        if button.isAddButton {
            counterView.counter += 1
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLabel.text = String(counterView.counter)
    }
    
    func animateBee(){
        let path = UIBezierPath()
        
        let imageBeeName = "bee"
        let imageBee = UIImage(named: imageBeeName)
        let imageView = UIImageView(image: imageBee)
        
        imageView.frame = CGRect(x: 55, y: 300, width: 87, height: 87)
        self.view.addSubview(imageView)
        
        path.move(to: CGPoint(x: 16, y: 239))
        path.addCurve(to: CGPoint(x: 301, y:239), controlPoint1: CGPoint(x:136, y: 373), controlPoint2: CGPoint(x:178, y: 110))
        
        // create a new CAKeyframeAnimation that animates the objects position
        let animation = CAKeyframeAnimation(keyPath: "position")

        // animations path is being set to bezier curve
        animation.path = path.cgPath
        
        // rotationMode -> bee will rotate to whatever it is currently related to on curve
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

