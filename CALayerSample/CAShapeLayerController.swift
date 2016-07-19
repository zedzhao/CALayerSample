//
//  CAShapeLayerController.swift
//  CALayerSample
//
//  Created by Kun on 16/7/13.
//  Copyright © 2016年 Kun. All rights reserved.
//

import UIKit

class CAShapeLayerController: UIViewController {
	
    var progressLayer:CAShapeLayer!
    var imageView:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
		imageView = UIImageView.init(frame: CGRectMake(100, 100, 100, 100))
        imageView.image = UIImage.init(named: "cresentEarthRisesAboveLunarHorizon")
        imageView.contentMode = .Center
        imageView.layer.masksToBounds = true
        imageView.layer.contentsRect = CGRectMake(0, 0, 1, 0.1)
        self.view.addSubview(imageView)
    }
    
    var i = 0
    @IBAction func buttonClick(sender: AnyObject, forEvent event: UIEvent) {
        
//        CATransaction.begin()
//        CATransaction.setDisableActions(true)
//        
//        i += 1
//        if i%2 == 0 {
//            imageView.layer.opacity = 1;
//        }
//        else{
//            UIView.animateWithDuration(0.2, animations: { 
//                
//            })
//        }
        
        
        
        progressLayer = CAShapeLayer.init()
        progressLayer.frame = CGRectMake(0, 0, 40, 40)
        progressLayer.cornerRadius = 20.0
        progressLayer.backgroundColor = UIColor.init(white: 0, alpha: 0.5).CGColor
        progressLayer.borderColor = UIColor.init(white: 0, alpha: 0.5).CGColor
        progressLayer.borderWidth = 1

        let bezierPath = UIBezierPath.init(roundedRect: CGRectInset(progressLayer.bounds, 10, 10), cornerRadius:10)
        
//        let path = CGPathCreateMutableCopy(bezierPath.CGPath)
//        var transform = CGAffineTransformIdentity
//        CGPathMoveToPoint(path, &transform, 0, 0)
//        CGPathAddQuadCurveToPoint(path, &transform, 300, 10, 40, 40)
        
        progressLayer.path = bezierPath.CGPath
        progressLayer.lineWidth = 2.0
        progressLayer.strokeColor = UIColor.redColor().CGColor
        progressLayer.strokeEnd = 0;
        progressLayer.strokeStart = 0;
//        progressLayer.lineCap = kCALineCapSquare
        progressLayer.fillColor = UIColor.clearColor().CGColor
        progressLayer.position = self.view.center
        
        self.view.layer.addSublayer(progressLayer)
        
        
//        let animation = CABasicAnimation.init(keyPath: "position.x")
//        animation.fromValue = 0
//        animation.toValue = 1
//        animation.beginTime = 0
//        animation.duration = 2
//        animation.repeatCount = HUGE
//        animation.additive = true
//        animation.delegate = self
        
        let animation = CAKeyframeAnimation.init(keyPath: "position.x")
        animation.values = [0,-20,20,-10,10,0]
        animation.calculationMode = kCAAnimationPaced
		animation.duration = 0.4
        animation.additive = true
        progressLayer.addAnimation(animation, forKey: nil)

        
    }
    

    
    
    override func animationDidStart(anim: CAAnimation) {
        
        
        print("start: \(progressLayer.position), model : \(progressLayer.modelLayer().position) presentLayer: \(progressLayer.presentationLayer()?.position)")
        print("\(progressLayer.animationForKey("position"))")

    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print("end : \(progressLayer.position), model : \(progressLayer.modelLayer().position) presentLayer: \(progressLayer.presentationLayer()?.position)")
    	print("\(progressLayer.animationForKey("position"))")
    }

//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        progressLayer.position = self.view.center
//    }
}
