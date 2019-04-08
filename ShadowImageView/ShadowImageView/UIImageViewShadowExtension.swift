//
//  UIImageViewShadowExtension.swift
//  ShadowImageView
//
//  Created by Warif Akhand Rishi on 8/4/19.
//  Copyright © 2019 Warif Akhand Rishi. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func dropShadow() {
        layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).cgColor
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 3.0
    }
    
    func dropShadowOverall() {
        //applying overall shadow to image
        layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 6.0
    }
    
    func dropShadowTrapezoidal() {
        let size = bounds.size
        let path = UIBezierPath()
        path.move(to: CGPoint(x: size.width * 0.20, y: size.height * 0.80))
        path.addLine(to: CGPoint(x: size.width * 0.80, y: size.height * 0.80))
        path.addLine(to: CGPoint(x: size.width * 1.20, y: size.height * 1.20))
        path.addLine(to: CGPoint(x: size.width * -0.20, y: size.height * 1.20))
        path.close()
        layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).cgColor
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 2.0
        layer.shadowPath = path.cgPath
    }
    
    func dropShadowElliptical() {
        let ovalRect = CGRect(x: 0.0, y: frame.size.height + 10, width: frame.size.width, height: 15)
        let path = UIBezierPath(ovalIn: ovalRect)
        layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 3.0
        layer.shadowPath = path.cgPath
    }
    
    func dropShadowCurl() {
        
        let size = frame.size
        let path = UIBezierPath()
        
        //starting from left point
        path.move(to: CGPoint(x: 0.0, y: size.height))
        path.addLine(to: CGPoint(x: 0.0, y: size.height + 20.0))
        
        //curved bottom part
        path.addCurve(to: CGPoint(x: size.width, y: size.height + 20.0), controlPoint1: CGPoint(x: 20.0, y: size.height), controlPoint2: CGPoint(x: size.width - 20.0, y: size.height))
        
        //closing the path by going upper top part
        path.addLine(to: CGPoint(x: size.width, y: size.height))
        
        //close the path and apply the path as shadow
        path.close()
        
        //applying shadow to imageView through the path created
        layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0);
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 3.0
        layer.shadowPath = path.cgPath
    }
    
    func dropShadowAnimated() {
        
        //applying the shadow
        layer.shadowColor =  UIColor(white: 0.0, alpha: 0.5).cgColor
        layer.shadowOffset = CGSize(width: 20.0, height: -20.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 2.0
        
        //applying animation to shadows
        let animation = CABasicAnimation(keyPath: "shadowOffset")
        animation.fromValue = NSValue(cgSize:CGSize(width: -20.0, height: -20.0))
        animation.toValue = NSValue(cgSize: CGSize(width: 20.0, height: -20.0))
        animation.duration = 2.0
        layer.add(animation, forKey: "shadowOffset")
    }
    
    func dropShadowRoundedCorners() {
        
        var shadowFrame = CGRect.zero // Modify this if needed
        shadowFrame.size.width = 0.0
        shadowFrame.size.height = 0.0
        shadowFrame.origin.x = 0.0
        shadowFrame.origin.y = 0.0
        
        let shadow = UIView(frame: shadowFrame)//[[UIView alloc] initWithFrame:shadowFrame];
        shadow.isUserInteractionEnabled = false; // Modify this if needed
        shadow.layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).cgColor
        shadow.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        shadow.layer.shadowRadius = 2.0
        shadow.layer.masksToBounds = false
        shadow.clipsToBounds = false
        shadow.layer.shadowOpacity = 1.0
        
        // TODO: BUG, NEED TO CHANGE
        superview?.insertSubview(shadow, belowSubview: self)
        shadow.addSubview(self)
    }
}
