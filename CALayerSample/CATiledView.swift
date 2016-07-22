//
//  CATiledView.swift
//  CALayerSample
//
//  Created by Kun on 16/7/21.
//  Copyright © 2016年 Kun. All rights reserved.
//

import UIKit
import QuartzCore

class CATiledView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override class func layerClass() -> AnyClass
    {
        return CATiledLayer.self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        srand48(Int(NSDate().timeIntervalSince1970))
        guard let layer = self.layer as? CATiledLayer else { return nil }
        layer.contentsScale = UIScreen.mainScreen().scale
        layer.tileSize = CGSizeMake(50, 50)
    }
    
    
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        CGContextSetRGBFillColor(context, red, green, blue, 1.0)
        CGContextFillRect(context, rect)
    }

}
