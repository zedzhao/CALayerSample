//
//  CAReplicatorLayerViewController.swift
//  CALayerSample
//
//  Created by Kun on 16/7/19.
//  Copyright © 2016年 Kun. All rights reserved.
//

import UIKit

class CAReplicatorLayerViewController: UIViewController {

    @IBOutlet weak var someView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
		setupReplicatorLayer()
        // Do any additional setup after loading the view.
    }
    
    let replicatorLayer = CAReplicatorLayer.init()
    
    func setupReplicatorLayer()
    {
        replicatorLayer.frame = someView.bounds
        replicatorLayer.instanceCount = 20
        replicatorLayer.instanceDelay = CFTimeInterval(1/20.0)
//        replicatorLayer.instanceColor = UIColor.whiteColor().CGColor
        replicatorLayer.instanceRedOffset = 2
        replicatorLayer.preservesDepth = true
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(15, 0, 100)
        
        someView.layer.addSublayer(replicatorLayer)
        
        let instanceLayer = CALayer.init()
        let layerHeight:CGFloat = 10.0
        let layerWidth:CGFloat = 10.0
        
        instanceLayer.frame = CGRectMake(0, (CGRectGetHeight(someView.bounds) - layerHeight)/2.0, layerWidth, layerHeight)
        instanceLayer.backgroundColor = UIColor.grayColor().CGColor
        replicatorLayer.addSublayer(instanceLayer)
        
        let fadeAnimation = CABasicAnimation.init(keyPath: "opacity")
        fadeAnimation.fromValue = 1
        fadeAnimation.toValue = 0
        fadeAnimation.duration = 1
        fadeAnimation.repeatCount = HUGE
        instanceLayer.addAnimation(fadeAnimation, forKey: nil)
    }
	

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
