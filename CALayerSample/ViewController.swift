//
//  ViewController.swift
//  CALayerSample
//
//  Created by Kun on 16/7/11.
//  Copyright © 2016年 Kun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewForLayer: UIView!
    var l : CALayer {
        return viewForLayer.layer
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        setupLayer()
        setupSomeView()
        
    }
    
    func setupLayer(){
        l.backgroundColor = UIColor.blueColor().CGColor
        l.borderWidth = 100.0
        l.borderColor = UIColor.redColor().CGColor;
        l.shadowRadius = 10.0
        l.shadowOpacity = 0.7
        l.contents = UIImage(named: "star")?.CGImage
        l.contentsGravity = kCAGravityCenter
        
    }
    
    func setupSomeView(){
        let layer = CALayer()
//        layer.frame = viewForLayer.bounds;
        
        l.contents = UIImage(named: "star")?.CGImage
        l.contentsGravity = kCAGravityCenter
        
        layer.magnificationFilter = kCAFilterNearest
        
        l.cornerRadius = l.frame.size.height/2.0
        l.borderWidth = 10.0
        l.borderColor = UIColor.whiteColor().CGColor
        l.masksToBounds = false
        
        l.shadowOpacity = 1.0
        l.shadowRadius = 5.0
        l.shadowOffset = CGSizeMake(0, 0)
        
        l.backgroundColor = UIColor(red: 11/255.0, green: 86/255.0, blue: 14/255.0, alpha: 1.0).CGColor
//        l.backgroundColor = UIColor.redColor().CGColor
//        viewForLayer.layer.addSublayer(layer)
        
    }

    @IBAction func tapGestureRecognized(UITapGestureRecognizer: AnyObject) {
        l.shadowOpacity = (l.shadowOpacity == 0.7) ? 0.0 : 0.7
    }
    
    @IBAction func pinchGestureRecognized(sender: UIPinchGestureRecognizer) {
        let offset:CGFloat = sender.scale < 1 ? 5.0 : -5.0
        let oldFrame = l.frame
        let oldOrigin = oldFrame.origin
        let newOrigin = CGPointMake(oldOrigin.x + offset, oldOrigin.y + offset)
        let newSize = CGSizeMake(oldFrame.width + (offset * -2.0), oldFrame.height + (offset * -2.0))
        let newFrame = CGRect(origin: newOrigin, size: newSize)
        if newFrame.width >= 100 && newFrame.width <= 300 {
            l.borderWidth -= offset
            l.cornerRadius += (offset/2.0)
            l.frame = newFrame
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

