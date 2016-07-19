//
//  ScrollingView.swift
//  CALayerSample
//
//  Created by Kun on 16/7/13.
//  Copyright © 2016年 Kun. All rights reserved.
//

import UIKit
import QuartzCore


class ScrollingView: UIView {
    override class func layerClass() -> AnyClass{
        return CAScrollLayer.self
    }
}

