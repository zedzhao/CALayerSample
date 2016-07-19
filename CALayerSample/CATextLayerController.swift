//
//  CATextLayerController.swift
//  CALayerSample
//
//  Created by Kun on 16/7/19.
//  Copyright © 2016年 Kun. All rights reserved.
//

import UIKit

class CATextLayerController: UIViewController {

    @IBOutlet weak var someView: UIView!
    var textLayer = CATextLayer.init()
    override func viewDidLoad() {
        
    }
    
    func setupTextLayer(){
        textLayer.frame = someView.bounds
        
    }

}
