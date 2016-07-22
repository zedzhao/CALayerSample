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
    let textLayer = CATextLayer.init()
    override func viewDidLoad() {
        setupTextLayer()
    }
    
    
    var fontSize:CGFloat = 20
    
    func setupTextLayer(){
        textLayer.frame = someView.bounds
        
        var string = ""
        for _ in 1...20{
            string += "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce auctor arcu quis velit congue dictum."
        }
        textLayer.string = string
        
        let fontName:CFStringRef = "Noteworthy-Light"
        textLayer.font = CTFontCreateWithName(fontName, 20, nil)
        
        textLayer.foregroundColor = UIColor.darkGrayColor().CGColor
        textLayer.fontSize = fontSize
        textLayer.wrapped = true
        textLayer.alignmentMode = kCAAlignmentLeft
        someView.layer.addSublayer(textLayer)
        
    }

    @IBAction func fontsizeSliderChanged(sender: UISlider) {
        fontSize = CGFloat(sender.value) * 20
    }
}
