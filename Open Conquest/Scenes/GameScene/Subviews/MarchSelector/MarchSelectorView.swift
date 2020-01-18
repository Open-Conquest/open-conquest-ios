//
//  AttackCityView.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/17/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class MarchSelectorView: UIView {
    var height: CGFloat?
    var width: CGFloat?
    
    func setup() {
        // setup constraints
        setupConstraints()
        
        // setup appearance
        self.backgroundColor = .white
        
        // setup gestures
        setupGestures()
    }
    
    func setupConstraints() {
        let heightOffset = UIScreen.main.bounds.height / 6
        let widthOffset = UIScreen.main.bounds.width / 18
        self.height = UIScreen.main.bounds.height - heightOffset * 2
        self.width = UIScreen.main.bounds.width - widthOffset * 2
        
        // setup size constraints
        self.autoSetDimensions(to: CGSize(width: width!, height: height!))
        
        // setup constraints to position view on screen
        self.autoPinEdge(.left, to: .left, of: superview!, withOffset: widthOffset)
        self.autoPinEdge(.right, to: .right, of: superview!, withOffset: -widthOffset)
        self.autoPinEdge(.top, to: .top, of: superview!, withOffset: heightOffset)
        self.autoPinEdge(.bottom, to: .bottom, of: superview!, withOffset: -heightOffset)
    }
    
    func setupGestures() {
        let tapSelector = #selector(self.handleTap(tapGesture:))
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: tapSelector)
        tapGestureRecognizer.numberOfTapsRequired = 1
        addGestureRecognizer(tapGestureRecognizer)
        
        isUserInteractionEnabled = true
    }
    
    @objc func handleTap(tapGesture: UITapGestureRecognizer) {
        if tapGesture.state != .ended {
            return
        }
        
        hide()
    }
    
    func hide() {
        let animation = CATransition()
        animation.type = .fade
        animation.duration = 0.4
        self.layer.add(animation, forKey: nil)
        
        self.isHidden = true
    }
    
    func show() {
        let animation = CATransition()
        animation.type = .reveal
        animation.duration = 0.4
        self.layer.add(animation, forKey: nil)
        
        self.isHidden = false
    }
}
