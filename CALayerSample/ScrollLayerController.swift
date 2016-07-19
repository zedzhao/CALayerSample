//
//  ScrollLayerController.swift
//  CALayerSample
//
//  Created by Kun on 16/7/12.
//  Copyright © 2016年 Kun. All rights reserved.
//

import UIKit

class ScrollLayerController: UIViewController {

    @IBOutlet weak var scrollView: ScrollingView!
    
    var originalFrame:CGRect!
    
    var scrollLayer: CAScrollLayer {
    	return scrollView.layer as! CAScrollLayer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollLayer.scrollMode = kCAScrollBoth
//        scrollLayer.masksToBounds = true
        scrollView.contentMode = UIViewContentMode.Center
        scrollView.layer.contentsRect = CGRectMake(0, 0, 1, 0.5)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(ScrollLayerController.tapRecognizer(_:)))
    	scrollView.addGestureRecognizer(tap)
    	print("\(scrollLayer.contentsCenter)")
    }
    
    @IBAction func pan(sender: UIPanGestureRecognizer) {
        var newPoint = scrollView.bounds.origin
        newPoint.x -= sender.translationInView(scrollView).x
        newPoint.y -= sender.translationInView(scrollView).y
        sender.setTranslation(CGPointZero, inView: scrollView)
        scrollLayer.scrollPoint(newPoint)
        
    }
    
    func tapRecognizer(sender: UITapGestureRecognizer){
        originalFrame = scrollLayer.frame
        var frame = CGRectZero

        if(sender.numberOfTouches() == 2)
        {
            frame = originalFrame
        }
        else{
            frame = scrollView.frame
            frame.origin.x -= 10
            frame.origin.y -= 10
        }
       
        
        scrollLayer.scrollToRect(originalFrame)
    }
}
