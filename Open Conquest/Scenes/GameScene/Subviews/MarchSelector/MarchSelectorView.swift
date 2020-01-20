//
//  MarchSelectorView.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/17/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class MarchSelectorView: UIView {
    var background: UIView
    var content: MarchSelectorContent
    
    override init(frame: CGRect) {
        background = UIView(frame: .zero)
        content = MarchSelectorContent(frame: .zero)
        super.init(frame: frame)
        addSubview(background)
        addSubview(content)
        setupGestures()
        hide()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let height = self.frame.height
        let width = self.frame.width
        let heightOffset = height / 6
        let widthOffset = width / 18
        
        background.autoPinEdge(.left, to: .left, of: self)
        background.autoPinEdge(.right, to: .right, of: self)
        background.autoPinEdge(.top, to: .top, of: self)
        background.autoPinEdge(.bottom, to: .bottom, of: self)
        
        content.autoPinEdge(.left, to: .left, of: self, withOffset: widthOffset)
        content.autoPinEdge(.right, to: .right, of: self, withOffset: -widthOffset)
        content.autoPinEdge(.top, to: .top, of: self, withOffset: heightOffset)
        content.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -heightOffset)
    }
    
    func setupGestures() {
        // add pan gesture to override any in lower layers
        let panSelector = #selector(self.handlePan(panGesture:))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: panSelector)
        self.addGestureRecognizer(panGestureRecognizer)
        
        let tapSelector = #selector(self.handleTap(tapGesture:))
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: tapSelector)
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handlePan(panGesture: UIPanGestureRecognizer) {
        // do nothing
    }
    
    @objc func handleTap(tapGesture: UITapGestureRecognizer) {
        if tapGesture.state != .ended {
            return
        }
        
        let tapLocation = tapGesture.location(in: self)
        
        // if invisible background was touched -> hide self
        let view = hitTest(tapLocation, with: .none)
        if (view == background) {
            hide()
        }
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
