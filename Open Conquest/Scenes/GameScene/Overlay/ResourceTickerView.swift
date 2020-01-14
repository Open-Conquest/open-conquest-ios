//
//  ResourceTickerView.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/6/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class ResourceTickerView: UIView {
    var icon: UIImageView = UIImageView()
    var background: UIView = UIView()
    var label: UILabel = UILabel()

    // setup all the subviews' constraints and properties
    func setupUI(resource: ResourceEnum) {
        let screenSize = UIScreen.main.bounds
        let resourceBackgroundHeight = screenSize.height/20.2
        let resourceBackgroundWidth = screenSize.width/4
        let resourceIconWidth = resourceBackgroundHeight
        
        addSubview(background)
        background.autoPinEdge(.top, to: .top, of: background.superview!)
        background.autoPinEdge(.bottom, to: .bottom, of: background.superview!)
        background.autoPinEdge(.left, to: .left, of: background.superview!)
        background.autoPinEdge(.right, to: .right, of: background.superview!)

        // pick icon image depending on resource type
        switch resource {
        case ResourceEnum.gold:
            icon.image = UIImage(named: "gold-1")
            label.text = "100"
        case ResourceEnum.power:
            label.text = "1023"
            icon.image = UIImage(named: "power")
        }
        icon.autoSetDimension(.height, toSize: resourceIconWidth)
        icon.autoSetDimension(.width, toSize: resourceIconWidth)
        addSubview(icon)
        icon.autoPinEdge(.left, to: .left, of: icon.superview!, withOffset: 0)

//        label.text = "0.34k"
        label.font = UIFont(name: "Chalkboard", size: 14)
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.left
        addSubview(label)
        label.autoPinEdge(.top, to: .top, of: label.superview!, withOffset: 0)
        label.autoPinEdge(.bottom, to: .bottom, of: label.superview!, withOffset: 0)
        label.autoPinEdge(.left, to: .right, of: icon, withOffset: 0)
        label.autoPinEdge(.right, to: .right, of: label.superview!, withOffset: -resourceBackgroundWidth/15)
    }
}
